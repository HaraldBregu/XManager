package it.ninespartans.dinamo.bluetooth

import android.bluetooth.*
import android.bluetooth.le.*
import android.content.Context
import android.os.Handler
import android.os.ParcelUuid
import android.util.Log
import org.jetbrains.anko.doAsync
import org.jetbrains.anko.uiThread
import java.util.*


object BLEManager {
    lateinit var didFoundDevice: ((BluetoothDevice) -> Unit)
    lateinit var onStartScanning: (() -> Unit)
    lateinit var onStopScanning: (() -> Unit)

    var scanning: Boolean = false

    private lateinit var selectedDevice: BluetoothDevice
    private var bleConnected: Boolean = false
    private var bluetoothGatt: BluetoothGatt? = null
    private lateinit var selectedService: BluetoothGattService
    private lateinit var selectedCharacteristic: BluetoothGattCharacteristic
    private lateinit var selectedDescriptor: BluetoothGattDescriptor

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
                .setServiceUuid(ParcelUuid(UUID.fromString("a327169a-31c0-4010-aebf-3e68ee255144")))
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
    }

    /**
     * Connect to device
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
        Handler().postDelayed({
            bleConnected = false
            completion?.invoke()
        }, after)
    }

    /**
     * Connect to Device
     */
    fun connectDevice(context: Context) {
        if (bleConnected) return

        bluetoothGatt = selectedDevice.connectGatt(context, false, object : BluetoothGattCallback() {

            override fun onConnectionStateChange(gatt: BluetoothGatt?, status: Int, newState: Int) {
                super.onConnectionStateChange(gatt, status, newState)
                val bleGatt = gatt.takeIf { it != null } ?: return
                bleGatt.discoverServices()
            }

            override fun onServicesDiscovered(gatt: BluetoothGatt?, status: Int) {
                super.onServicesDiscovered(gatt, status)

                Log.i("SERVICE_DISCOVERED", status.toString())

                val gatt = gatt.takeIf { it != null } ?: return
                selectedService = gatt.getService(UUID.fromString("a327169a-31c0-4010-aebf-3e68ee255144"))
                selectedCharacteristic = selectedService.getCharacteristic(UUID.fromString("e8e0d1f9-d24d-41b8-9a81-38be02772944"))
                selectedDescriptor = selectedCharacteristic.getDescriptor(UUID.fromString("29976087-4812-4e67-8624-67d10df59231"))
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
            }

            override fun onCharacteristicWrite(gatt: BluetoothGatt?, characteristic: BluetoothGattCharacteristic?, status: Int) {
                super.onCharacteristicWrite(gatt, characteristic, status)

                Log.i("CHARACTERISTIC_WRITE", characteristic?.value.toString())
            }

            override fun onDescriptorRead(gatt: BluetoothGatt?, descriptor: BluetoothGattDescriptor?, status: Int) {
                super.onDescriptorRead(gatt, descriptor, status)

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

    fun read() {
        bluetoothGatt?.readCharacteristic(selectedCharacteristic)
        bluetoothGatt?.setCharacteristicNotification(selectedCharacteristic, true)
        selectedDescriptor.setValue(BluetoothGattDescriptor.ENABLE_NOTIFICATION_VALUE)
        bluetoothGatt?.writeDescriptor(selectedDescriptor)
    }

    fun close() {
        bluetoothGatt?.close()
    }

}