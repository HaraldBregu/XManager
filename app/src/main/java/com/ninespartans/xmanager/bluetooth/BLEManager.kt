package com.ninespartans.xmanager.bluetooth

import android.Manifest
import android.bluetooth.*
import android.bluetooth.le.*
import android.content.Context
import android.os.Handler
import android.os.ParcelUuid
import android.util.Log
import org.jetbrains.anko.doAsync
import org.jetbrains.anko.uiThread
import java.util.*
import android.bluetooth.BluetoothDevice
import android.content.pm.PackageManager
import android.location.LocationManager
import android.os.Looper
import androidx.core.content.ContextCompat

object BLEManager {
    private const val GENERAL_SERVICE = "a327169a-31c0-4010-aebf-3e68ee255144"
    private const val GENERAL_CHARACTERISTIC = "e8e0d1f9-d24d-41b8-9a81-38be02772944"
    private const val GENERAL_DESCRIPTOR = "29976087-4812-4e67-8624-67d10df59231"

    //private const val GENERAL_SERVICE = "00001542-1212-efde-1523-785feabcd121"
    //private const val GENERAL_CHARACTERISTIC = "00001524-1212-efde-1523-785feabcd121"
    //private const val GENERAL_DESCRIPTOR = "29976087-4812-4e67-8624-67d10df59231"

    //00001542-1212-efde-1523-785feabcd121 Service
    //00001524-1212-efde-1523-785feabcd121
    //00009987-1212-efde-1523-785feabcd121
    //00009999-1212-efde-1523-785feabcd121

    private const val GENERAL_SERVICE_NRF = "00001542-1212-efde-1523-785feabcd121"
    private const val GENERAL_CHARACTERISTIC_NRF = "00001542-1212-efde-1523-785feabcd121"

    lateinit var didFoundDevice: ((BluetoothDevice) -> Unit)
    lateinit var onStartScanning: (() -> Unit)
    lateinit var onStopScanning: (() -> Unit)

    var onConnectionStateChange: ((bleGatt: BluetoothGatt, status: Int, newState: Int) -> Unit)? = null
    var onServiceDiscovered: ((Boolean) -> Unit)? = null
    var onCharacteristicRead: ((BluetoothGattCharacteristic?) -> Unit)? = null
    var onCharacteristicWrite: ((BluetoothGattCharacteristic?) -> Unit)? = null

    var scanning: Boolean = false

    private lateinit var selectedDevice: BluetoothDevice
    private var bleConnected: Boolean = false
    private var bluetoothGatt: BluetoothGatt? = null
    private lateinit var selectedService: BluetoothGattService
    private lateinit var selectedCharacteristic: BluetoothGattCharacteristic
    private lateinit var selectedDescriptor: BluetoothGattDescriptor

    private var reading: Boolean = false

    //val bluetoothManager = context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
    //bluetoothManager.getAdapter()

    var adapter: BluetoothAdapter? = null
        get() = BluetoothAdapter.getDefaultAdapter()

    var adapterEnabled: Boolean = false
        get() = BluetoothAdapter.getDefaultAdapter().isEnabled

    var scanner: BluetoothLeScanner = adapter!!.bluetoothLeScanner


    /**
     * Scan for devices
     */
    fun startScanning(stopAfter: Long = 5000) {
        if (scanning) return

        doAsync {
            val scanFilter = ScanFilter.Builder()
                .setServiceUuid(ParcelUuid(UUID.fromString(GENERAL_SERVICE)))
                .build()

            val scanFilters: List<ScanFilter> = listOf(scanFilter)

            val settings = ScanSettings.Builder()
                .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
                .build()

            scanner.startScan(scanFilters, settings, scanCallBack)

            uiThread {
                scanning = true
                onStartScanning.invoke()
            }
        }
        
        Handler().postDelayed(Runnable {
            stopScanning()
        }, stopAfter)

    }

    /**
     * Get Device by MAC
     */
    fun getDevice(address: String) {
        val device = adapter?.getRemoteDevice(address).takeIf { it != null } ?: return
        selectedDevice = device
    }

    fun stopScanning() {
        if (!scanning) return

        doAsync {

            scanner.stopScan(scanCallBack)

            uiThread {
                scanning = false
                onStopScanning.invoke()
            }
        }
    }

    private val scanCallBack = object : ScanCallback() {
        override fun onScanResult(callbackType: Int, result: ScanResult?) {
            super.onScanResult(callbackType, result)

            val device = result?.device.takeIf { it != null } ?: return
            didFoundDevice(device)
        }

        override fun onBatchScanResults(results: MutableList<ScanResult>?) {
            super.onBatchScanResults(results)

        }

        override fun onScanFailed(errorCode: Int) {
            super.onScanFailed(errorCode)
        }
    }

    /**
     * Select the device
     */
    fun selectDevice(device: BluetoothDevice) {
        selectedDevice = device
    }

    /**
     * Disconnect to Device
     * Callback handler when done
     */
    fun disconnectDevice(completion: (() -> Unit)? = null, after: Long = 1000) {
        if (!bleConnected) {
            completion?.invoke()
            return
        }

        bluetoothGatt?.disconnect()
        //bluetoothGatt?.close()

        Handler(Looper.getMainLooper()).postDelayed({
            bleConnected = false
            completion?.invoke()
        }, after)
    }

    fun connected(): Boolean {
        return bleConnected
    }

    /**
     * Connect to Device
     */
    fun connectDevice(context: Context) {
        if (bleConnected) return

        bluetoothGatt = selectedDevice.connectGatt(context, false, object : BluetoothGattCallback() {

            override fun onConnectionStateChange(gatt: BluetoothGatt?, status: Int, newState: Int) {
                super.onConnectionStateChange(gatt, status, newState)

                gatt?.let { gatt ->
                    gatt.discoverServices()

                    onConnectionStateChange?.let {
                        it(gatt, status, newState)
                    }
                }
            }

            override fun onServicesDiscovered(gatt: BluetoothGatt?, status: Int) {
                super.onServicesDiscovered(gatt, status)
                Log.i("SERVICE_DISCOVERED", status.toString())

                val gattObject = gatt.takeIf { it != null } ?: return

                val service = gattObject.getService(UUID.fromString(GENERAL_SERVICE)).takeIf { it !=null } ?: return
                selectedService = service
                selectedService.characteristics.forEach {
                    val uuid =   it.uuid.toString()
                    Log.i("SELECTED_CHARACTERISTIC", uuid)
                }

                selectedCharacteristic = selectedService.getCharacteristic(UUID.fromString(GENERAL_CHARACTERISTIC))

                Log.i("SELECTED_CHARACTERISTIC", selectedCharacteristic.uuid.toString())

                //selectedDescriptor = selectedCharacteristic.getDescriptor(UUID.fromString(GENERAL_DESCRIPTOR))
                //Log.i("SELECTED_DESCRIPTOR", selectedDescriptor.uuid.toString())

                onServiceDiscovered?.let {
                    it(true)
                }
            }

            override fun onCharacteristicChanged(gatt: BluetoothGatt?, characteristic: BluetoothGattCharacteristic?) {
                super.onCharacteristicChanged(gatt, characteristic)

                //val message = characteristic?.value.toString()
                //val currentText = output_log_textview.text.toString().replace(" ", "")
                //output_log_textview.text = currentText + "\n" + message
                //output_log_scrollview.fullScroll(View.FOCUS_DOWN)

                Log.i("CHARACTERISTIC_CHANGED", characteristic?.value.toString())
            }

            override fun onCharacteristicRead(gatt: BluetoothGatt?, characteristic: BluetoothGattCharacteristic?, status: Int) {
                super.onCharacteristicRead(gatt, characteristic, status)

                Log.i("CHARACTERISTIC_READ", characteristic?.value.toString())
                onCharacteristicRead?.let {
                    enableReading()
                    it(characteristic)
                }
            }

            override fun onCharacteristicWrite(gatt: BluetoothGatt?, characteristic: BluetoothGattCharacteristic?, status: Int) {
                super.onCharacteristicWrite(gatt, characteristic, status)

                Log.i("CHARACTERISTIC_WRITE", characteristic?.value.toString())
                onCharacteristicWrite?.let {
                    it(characteristic)
                }
            }

            override fun onDescriptorRead(gatt: BluetoothGatt?, descriptor: BluetoothGattDescriptor?, status: Int) {
                super.onDescriptorRead(gatt, descriptor, status)

                //bluetoothGatt?.readDescriptor(selectedDescriptor)
                //selectedDescriptor.setValue(BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE)

                Log.i("DESCRIPTOR_READ", descriptor?.value.toString())
            }

            override fun onDescriptorWrite(gatt: BluetoothGatt?, descriptor: BluetoothGattDescriptor?, status: Int) {
                super.onDescriptorWrite(gatt, descriptor, status)

                Log.i("DESCRIPTOR_WRITE", descriptor?.value.toString())
            }

        })

        bluetoothGatt?.let {
            it.connect()
            bleConnected = true
        }
    }

    fun deviceConnected(): Boolean {
        return bleConnected
    }

    fun enableReading() {
        bluetoothGatt?.setCharacteristicNotification(
            selectedCharacteristic, true)
        bluetoothGatt?.readCharacteristic(selectedCharacteristic)
    }

    fun disableReading() {
        onCharacteristicRead = null
    }

    fun write(byteArray: ByteArray) {
        selectedCharacteristic.value = byteArray
        bluetoothGatt?.setCharacteristicNotification(selectedCharacteristic, true)
        bluetoothGatt?.writeCharacteristic(selectedCharacteristic)
        //selectedDescriptor.setValue(BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE)
        //bluetoothGatt?.writeDescriptor(selectedDescriptor)
    }

    fun write(string: String) {
        selectedCharacteristic.setValue(string)
        bluetoothGatt?.setCharacteristicNotification(selectedCharacteristic, true)
        bluetoothGatt?.writeCharacteristic(selectedCharacteristic)
        //selectedDescriptor.setValue(BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE)
        //bluetoothGatt?.writeDescriptor(selectedDescriptor)
    }

    fun close() {
        bluetoothGatt?.close()
    }

    /**
     * Util function
     * Function to check if some permission is granted
     */
    fun isPermissionGranted(permission:String, context: Context):Boolean = ContextCompat.checkSelfPermission(context, permission) == PackageManager.PERMISSION_GRANTED

    fun isBleScanGranted(context: Context): Boolean =
        isPermissionGranted(
            Manifest.permission.BLUETOOTH_SCAN,
            context)

    fun bleGranted(context: Context): Boolean =
        isPermissionGranted(
            Manifest.permission.BLUETOOTH,
            context
        )
    fun bleAdminGranted(context: Context): Boolean =
        isPermissionGranted(
            Manifest.permission.BLUETOOTH_ADMIN,
            context
        )
    fun coarseLocationGranted(context: Context):Boolean =
        isPermissionGranted(
            Manifest.permission.ACCESS_COARSE_LOCATION,
            context
        )
    fun fineLocationGranted(context: Context):Boolean =
        isPermissionGranted(
            Manifest.permission.ACCESS_FINE_LOCATION,
            context
        )

    fun bleIsEnabled(): Boolean {
        BluetoothAdapter.getDefaultAdapter()?.let { return it.isEnabled }
        return false
    }

    fun gpsEnabled(context: Context): Boolean {
        val locationManager = context.getSystemService(Context.LOCATION_SERVICE) as LocationManager
        return locationManager.isProviderEnabled(LocationManager.GPS_PROVIDER)
    }

    fun canStart(context: Context): Boolean {
        return bleIsEnabled() &&
                gpsEnabled(context) &&
                bleGranted(context) &&
                bleAdminGranted(context) &&
                fineLocationGranted(context)
    }

}