package it.ninespartans.dinamo

import android.app.AlertDialog
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.appcompat.app.AppCompatActivity

import kotlinx.android.synthetic.main.activity_device_pair_search.*
import kotlinx.android.synthetic.main.content_device_pair_search.*
import kotlinx.android.synthetic.main.content_device_pair_start.nextButton
import kotlinx.android.synthetic.main.row_device.view.*


class DevicePairSearchActivity : AppCompatActivity() {
    private var m_bluetoothAdapter: BluetoothAdapter? = null
    private var discoveredDevices: ArrayList<BluetoothDevice> = ArrayList()

    private lateinit var adapter: MyCustomAdapter
    //private var items: ArrayList<BluetoothDevice> = ArrayList()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_search)
        setSupportActionBar(toolbar)

        supportActionBar?.setDisplayHomeAsUpEnabled(true)

        m_bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()

        var bluetoothAdapter = m_bluetoothAdapter?.takeIf { it != null } ?: return

        if (bluetoothAdapter.isDiscovering) { bluetoothAdapter.cancelDiscovery() }
        bluetoothAdapter.startDiscovery()

        nextButton.setOnClickListener {
            val intent = Intent(this, MainActivity::class.java)
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            startActivity(intent)
            overridePendingTransition(R.anim.bottom_down, R.anim.nothing)
        }

        val bluetoothIntentFilter = IntentFilter()
        bluetoothIntentFilter.addAction(BluetoothDevice.ACTION_FOUND)
        bluetoothIntentFilter.addAction(BluetoothDevice.ACTION_NAME_CHANGED)
        bluetoothIntentFilter.addAction(BluetoothDevice.ACTION_BOND_STATE_CHANGED)
        bluetoothIntentFilter.addAction(BluetoothAdapter.ACTION_STATE_CHANGED)
        bluetoothIntentFilter.addAction(BluetoothAdapter.ACTION_DISCOVERY_STARTED)
        bluetoothIntentFilter.addAction(BluetoothAdapter.ACTION_DISCOVERY_FINISHED)
        bluetoothIntentFilter.addAction(BluetoothAdapter.ACTION_REQUEST_DISCOVERABLE)
        registerReceiver(onBroadcastReceiver, bluetoothIntentFilter)

        adapter = MyCustomAdapter(this, discoveredDevices)
        //adapter.notifyDataSetChanged()
        list_view.adapter = adapter
        list_view.setOnItemClickListener { adapterView, view, i, l ->

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

        unregisterReceiver(onBroadcastReceiver)
    }

    override fun onBackPressed() {
        super.onBackPressed()

    }

    override fun onSupportNavigateUp(): Boolean {
        super.onBackPressed()

        return super.onSupportNavigateUp()
    }


    /**
     * Adapter
     * ListView Adapter
     */
    private class MyCustomAdapter(context: Context, items: ArrayList<BluetoothDevice>): BaseAdapter() {
        private val mContext: Context
        private val mItems: ArrayList<BluetoothDevice>
        private var inflater: LayoutInflater

        init {
            mContext = context
            mItems = items
            inflater = LayoutInflater.from(mContext)
        }

        override fun getCount(): Int {
            return mItems.size
        }

        override fun getItemId(position: Int): Long {
            return  position.toLong()
        }

        override fun getItem(position: Int): Any {
            return "TEST STRING"
        }

        override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
            val rowDevice = inflater.inflate(R.layout.row_device, viewGroup, false)

            rowDevice.textView.text = mItems.get(position).name
            rowDevice.textView2.text = mItems.get(position).address

            return rowDevice
        }

    }

    /**
     * BroadcastReceiver
     * Object class to manage the broadcasting
     */
    private val onBroadcastReceiver = object : BroadcastReceiver() {

        override fun onReceive(contxt: Context?, intent: Intent?) {

            Log.i("ACTION_INTENT", intent?.action)

            /**
             * ACTIONS
             * Get intent actions
             */
            when(intent?.action) {

                /**
                 * ACTION FOUND
                 * When found other bluetooth device
                 * Store the device to a list of devices
                 */
                BluetoothDevice.ACTION_FOUND -> {

                    val intent = intent.takeIf { it != null } ?: return
                    val device = intent.getParcelableExtra<BluetoothDevice>(BluetoothDevice.EXTRA_DEVICE)
                    val name = device.name
                    val address = device.address
                    val message = name + " " + address
                    //val currentText = discovering_log_text.text.toString().replace(" ", "")
                    //discovering_log_text.text = currentText + "\n" + message

                    discoveredDevices.add(device)
                    discoveredDevices = ArrayList(discoveredDevices.distinctBy { it.address })

                    adapter.notifyDataSetChanged()
                }

                /**
                 * ACTION_NAME_CHANGED
                 * Don't know when is called
                 */
                BluetoothDevice.ACTION_NAME_CHANGED -> {
                    //Toast.makeText(this@MainActivity, "ACTION_NAME_CHANGED", Toast.LENGTH_SHORT).show()
                }

                /**
                 * ACTION_BOND_STATE_CHANGED
                 * Called when pairing/bonding a device
                 */
                BluetoothDevice.ACTION_BOND_STATE_CHANGED -> {
                    val device = intent.getParcelableExtra<BluetoothDevice>(BluetoothDevice.EXTRA_DEVICE)
                    if (device.bondState == BluetoothDevice.BOND_BONDED) {
                        Toast.makeText(this@DevicePairSearchActivity, "BOND_BONDED", Toast.LENGTH_SHORT).show()
                    }
                    if (device.bondState == BluetoothDevice.BOND_BONDING) {
                        Toast.makeText(this@DevicePairSearchActivity, "BOND_BONDING", Toast.LENGTH_SHORT).show()
                    }
                    if (device.bondState == BluetoothDevice.BOND_NONE) {
                        Toast.makeText(this@DevicePairSearchActivity, "BOND_NONE", Toast.LENGTH_SHORT).show()
                    }
                }

                /**
                 * ACTION_STATE_CHANGED
                 * Don't know when is called
                 */
                BluetoothAdapter.ACTION_STATE_CHANGED -> {
                    //Toast.makeText(this@MainActivity, "ACTION_STATE_CHANGED", Toast.LENGTH_SHORT).show()
                }

                /**
                 * ACTION_DISCOVERY_STARTED
                 * Called when the discovering of new device started
                 */
                BluetoothAdapter.ACTION_DISCOVERY_STARTED -> {
                    Toast.makeText(this@DevicePairSearchActivity, "ACTION_DISCOVERY_STARTED", Toast.LENGTH_SHORT).show()
                    circular_progress_bar.visibility = View.VISIBLE
                }

                /**
                 * ACTION_DISCOVERY_FINISHED
                 * Called when the discovering of new device did finish
                 */
                BluetoothAdapter.ACTION_DISCOVERY_FINISHED -> {
                    Toast.makeText(this@DevicePairSearchActivity, "ACTION_DISCOVERY_FINISHED", Toast.LENGTH_SHORT).show()
                    circular_progress_bar.visibility = View.GONE
                    var bluetoothAdapter = m_bluetoothAdapter?.takeIf { it != null } ?: return
                    bluetoothAdapter.cancelDiscovery()
                    showNearDevices()
                }

                /**
                 * ACTION_REQUEST_DISCOVERABLE
                 * Don't know when is called
                 */
                BluetoothAdapter.ACTION_REQUEST_DISCOVERABLE -> {
                    //Toast.makeText(this@MainActivity, "ACTION_REQUEST_DISCOVERABLE", Toast.LENGTH_SHORT).show()
                }
            }
        }
    }

    /**
     * Near devices
     * Get near devices end presenting it
     */
    private fun showNearDevices() {
        val builderSingle = AlertDialog.Builder(this)
        builderSingle.setTitle("Near bluetooth devices")
        val devices = discoveredDevices.filter { it.name != null }
        val names = devices.map { it.name }.filterNotNull()

        val arrayAdapter = ArrayAdapter(this, android.R.layout.select_dialog_item, names)
        builderSingle.setAdapter(arrayAdapter) { dialog, which ->
            val deviceName = arrayAdapter.getItem(which).takeIf { it != null } ?: return@setAdapter
            val device = devices.find { it.name == deviceName }.takeIf { it != null } ?: return@setAdapter
            val builderInner = AlertDialog.Builder(this)
            builderInner.setTitle("Selected device")
            val name = device.name
            val address = device.address
            val message = name + "\n" + address
            builderInner.setMessage(message)
            builderInner.setNeutralButton("PAIR") { dialog, which ->
                if (Build.VERSION.SDK_INT > Build.VERSION_CODES.JELLY_BEAN_MR2) {
                    device.createBond()
                }
            }
            builderInner.setPositiveButton("NEXT") { dialog, which ->
                dialog.dismiss()
                /*val intent = Intent(this, DeviceActivity::class.java).apply {
                    putExtra("bluetooth_device", device)
                }
                startActivity(intent)*/
            }
            builderInner.show()
        }
        builderSingle.show()
    }

}
