package it.ninespartans.dinamo

import android.bluetooth.*
import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_device_pair_search.*
import kotlinx.android.synthetic.main.content_device_pair_search.*
import kotlinx.android.synthetic.main.content_device_pair_start.nextButton
import kotlinx.android.synthetic.main.row_device.view.*
import android.os.*
import it.ninespartans.dinamo.bluetooth.BLEManager
import kotlin.collections.ArrayList


class DevicePairSearchActivity : AppCompatActivity() {
    private var discoveredDevices: ArrayList<BluetoothDevice> = ArrayList()
    private lateinit var adapter: DeviceAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_search)
        setSupportActionBar(toolbar)

        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        adapter = DeviceAdapter(this)
        adapter.items = ArrayList()
        list_view.adapter = adapter
        list_view.setOnItemClickListener { parent, view, position, id ->
            BLEManager.stopScanning()

            val element = adapter.getItem(position) as BluetoothDevice
            BLEManager.selectDevice(element)

            BLEManager.disconnectDevice({
                BLEManager.connectDevice(this)
            }, 1000)
        }

        nextButton.setOnClickListener {
            val intent = Intent(this, DevicePairSelectActivity::class.java)
            //intent.putExtra("selected_device", deviceSelected)
            startActivity(intent)
        }

        updateScanButton()
        scanButton.setOnClickListener {
            if (BLEManager.scanning) {
                BLEManager.stopScanning()
            } else {
                BLEManager.startScanning(3000)
            }
        }

        BLEManager.startScanning(3000)
        BLEManager.didFoundDevice = {

            discoveredDevices.add(it)
            discoveredDevices = ArrayList(discoveredDevices.distinctBy { it.address })

            val devices = discoveredDevices.filter { it.name != null }
            adapter.items = ArrayList(devices)
            adapter.notifyDataSetChanged()
        }

        BLEManager.onStartScanning = {
            circular_progress_bar.visibility = View.VISIBLE
            discoveredDevices.clear()
            adapter.items.clear()
            adapter.notifyDataSetChanged()
            updateScanButton()
        }

        BLEManager.onStopScanning = {
            circular_progress_bar.visibility = View.GONE
            updateScanButton()
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

        BLEManager.stopScanning()
        BLEManager.close()
    }

    override fun onBackPressed() {
        super.onBackPressed()
    }

    override fun onSupportNavigateUp(): Boolean {
        super.onBackPressed()
        return super.onSupportNavigateUp()
    }

    fun updateScanButton() {
        if (BLEManager.scanning) {
            scanButton.text = "STOP SCANNING"
            return
        }
        scanButton.text = "SCAN"
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
