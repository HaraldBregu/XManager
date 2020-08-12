package it.ninespartans.dinamo

import android.app.AlertDialog
import android.bluetooth.*
import android.bluetooth.le.BluetoothLeScanner
import android.bluetooth.le.ScanCallback
import android.bluetooth.le.ScanFilter
import android.bluetooth.le.ScanResult
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AppCompatActivity

import kotlinx.android.synthetic.main.activity_device_pair_search.*
import kotlinx.android.synthetic.main.content_device_pair_search.*
import kotlinx.android.synthetic.main.content_device_pair_start.nextButton
import kotlinx.android.synthetic.main.row_device.view.*
import java.io.IOException
import android.bluetooth.le.ScanSettings
import androidx.core.app.ComponentActivity.ExtraData
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import android.os.*
import java.util.*
import kotlin.collections.ArrayList


class DevicePairSearchActivity : AppCompatActivity() {
    private var m_bluetoothAdapter: BluetoothAdapter? = null
    private lateinit var bluetoothLeScanner: BluetoothLeScanner
    private lateinit var discoveredDevices: ArrayList<BluetoothDevice>
    private lateinit var deviceSelected: BluetoothDevice
    private lateinit var bluetoothGatt: BluetoothGatt
    private lateinit var selectedService: BluetoothGattService
    private lateinit var selectedCharacteristic: BluetoothGattCharacteristic
    private lateinit var selectedDescriptor: BluetoothGattDescriptor

    private lateinit var adapter: DeviceAdapter
    private val SCAN_PERIOD: Long = 5000
    private val mHandler = Handler()
    private var bleScanning: Boolean = false
    private var bleConnected: Boolean = false

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_search)
        setSupportActionBar(toolbar)

        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        discoveredDevices = ArrayList()
        m_bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
        var bluetoothAdapter = m_bluetoothAdapter?.takeIf { it != null } ?: return
        bluetoothLeScanner = bluetoothAdapter.bluetoothLeScanner

        startScanning()

        adapter = DeviceAdapter(this)
        adapter.items = discoveredDevices
        list_view.adapter = adapter
        list_view.setOnItemClickListener { parent, view, position, id ->

            val element = adapter.getItem(position) as BluetoothDevice

            deviceSelected = element
            bluetoothGatt = deviceSelected.connectGatt(this, false, object : BluetoothGattCallback() {

                override fun onConnectionStateChange(gatt: BluetoothGatt?, status: Int, newState: Int) {
                    super.onConnectionStateChange(gatt, status, newState)

                    Log.i("CONNECTION_CHANGED", newState.toString())

                    when(newState) {

                        BluetoothGatt.GATT_SUCCESS -> {
                            //Log.i("GATT", "SUCCESS")
                        }

                        BluetoothGatt.GATT_FAILURE -> {
                            //Log.i("GATT", "FAILURE")
                        }

                        BluetoothGatt.GATT_READ_NOT_PERMITTED -> {
                            //Log.i("GATT", "GATT_READ_NOT_PERMITTED")
                        }

                    }

                    val gatt = gatt.takeIf { it != null } ?: return
                    gatt.discoverServices()
                }

                override fun onServicesDiscovered(gatt: BluetoothGatt?, status: Int) {
                    super.onServicesDiscovered(gatt, status)

                    //Toast.makeText(this@DevicePairSearchActivity, "SERVICE DISCOVERED", Toast.LENGTH_SHORT).show()

                    Log.i("SERVICE_DISCOVERED", status.toString())

                    val gatt = gatt.takeIf { it != null } ?: return
                    val tmpServices = gatt.services.mapNotNull { it }
                    //services = ArrayList(tmpServices)
                    //services_count_value.text = services.count().toString()


                    tmpServices.forEach{
                        Log.i("SERVICe", it.uuid.toString())
                    }

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
            bluetoothGatt.connect()
            bleConnected = true
        }

        nextButton.setOnClickListener {
            val intent = Intent(this, DevicePairSetActivity::class.java)
            //intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            startActivity(intent)
            //overridePendingTransition(R.anim.bottom_down, R.anim.nothing)
        }

        scanButton.setOnClickListener {
            if (bleScanning) return@setOnClickListener
            startScanning()
        }

        disconnectButton.setOnClickListener {
            try {
                bluetoothGatt.close()
                bluetoothGatt.disconnect()
                bleConnected = false
            } catch (e: IOException) {
            }

            Log.i("CONN_STATE", bleConnected.toString())

        }

    }

    override fun onStart() {
        super.onStart()
    }

    override fun onResume() {
        super.onResume()
    }

    override fun onDestroy() {
        super.onDestroy()
    }

    override fun onBackPressed() {
        super.onBackPressed()
    }

    override fun onSupportNavigateUp(): Boolean {
        super.onBackPressed()

        return super.onSupportNavigateUp()
    }

    /**
     * Start scanning for devices
     */
    fun startScanning() {
        bleScanning = true
        circular_progress_bar.visibility = View.VISIBLE

        AsyncTask.execute( Runnable {

            val scanFilter = ScanFilter.Builder()
                .setServiceUuid(ParcelUuid(UUID.fromString("a327169a-31c0-4010-aebf-3e68ee255144")))
                .build()
            val scanFilters: List<ScanFilter> = listOf(scanFilter)

            val settings = ScanSettings.Builder()
                .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
                .build()

            bluetoothLeScanner.startScan(scanFilters, settings,  object : ScanCallback() {

                override fun onScanResult(callbackType: Int, result: ScanResult?) {
                    super.onScanResult(callbackType, result)

                    val device = result?.device.takeIf { it != null } ?: return
                    discoveredDevices.add(device)
                    discoveredDevices = ArrayList(discoveredDevices.distinctBy { it.address })

                    val devices = discoveredDevices.filter { it.name != null }
                    adapter.items = ArrayList(devices)
                    adapter.notifyDataSetChanged()
                }
            })
        })

        mHandler.postDelayed(Runnable {
            stopScanning()
        }, SCAN_PERIOD)

    }

    /**
     * Stop scanning
     */
    fun stopScanning() {
        bleScanning = false
        circular_progress_bar.visibility = View.GONE

        AsyncTask.execute(Runnable {

            bluetoothLeScanner.stopScan(object : ScanCallback() {
                override fun onScanResult(callbackType: Int, result: ScanResult?) {
                    super.onScanResult(callbackType, result)
                }
            })
        })
    }

    /**
     * Adapter
     * ListView Adapter
     */
    private class DeviceAdapter(context: Context): BaseAdapter() {
        private val mContext: Context
        var items: ArrayList<BluetoothDevice> = ArrayList()
        private var inflater: LayoutInflater

        init {
            mContext = context
            inflater = LayoutInflater.from(mContext)
        }

        override fun getCount(): Int {
            return items.size
        }

        override fun getItemId(position: Int): Long {
            return position.toLong() //mItems.get(position).address.toLong()
        }

        override fun getItem(position: Int): Any {
            return items.get(position)
        }

        override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
            val rowDevice = inflater.inflate(R.layout.row_device, viewGroup, false)

            rowDevice.textView.text = items.get(position).name
            rowDevice.textView2.text = items.get(position).address

            return rowDevice
        }

    }

}
