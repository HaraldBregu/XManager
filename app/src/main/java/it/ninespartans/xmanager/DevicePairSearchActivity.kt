package it.ninespartans.xmanager

import android.app.AlertDialog
import android.bluetooth.*
import android.content.Context
import android.content.Intent
import android.opengl.Visibility
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
import io.realm.Realm
import io.realm.RealmList
import io.realm.kotlin.where
import it.ninespartans.xmanager.bluetooth.BLEManager
import it.ninespartans.xmanager.model.Player
import it.ninespartans.xmanager.model.Device
import kotlinx.android.synthetic.main.content_create_player.*
import kotlin.collections.ArrayList

class DevicePairSearchActivity : AppCompatActivity() {
    private var discoveredDevices: ArrayList<BluetoothDevice> = ArrayList()
    private lateinit var adapter: it.ninespartans.xmanager.DevicePairSearchActivity.DeviceAdapter
    var playerId: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(it.ninespartans.xmanager.R.layout.activity_device_pair_search)
        setSupportActionBar(toolbar)

        title = "Search and pair"
        //supportActionBar?.setDisplayHomeAsUpEnabled(true)
        //intent.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)

        playerId = intent.getStringExtra("player_id")

        //nextButton.visibility = View.GONE
        //nextButton.isEnabled = false




        /**
         * Show Player Name
         */
        intent.getStringExtra("player_name")?.let {
            deviceSearchTitle.text = it
        }


        adapter = it.ninespartans.xmanager.DevicePairSearchActivity.DeviceAdapter(this)
        adapter.items = ArrayList()
        list_view.adapter = adapter
        list_view.setOnItemClickListener { parent, view, position, id ->
            //nextButton.visibility = View.GONE
            //nextButton.isEnabled = false
            it.ninespartans.xmanager.bluetooth.BLEManager.stopScanning()

            val element = adapter.getItem(position) as BluetoothDevice
            it.ninespartans.xmanager.bluetooth.BLEManager.selectDevice(element)

            // Before connecting to new device,
            // disconnect to old devices if available.
            it.ninespartans.xmanager.bluetooth.BLEManager.disconnectDevice({
                it.ninespartans.xmanager.bluetooth.BLEManager.connectDevice(this)
                //nextButton.visibility = View.VISIBLE
                //nextButton.isEnabled = true
            }, 2000)


            /**
             * Update player with the new device
             */
            Realm.getDefaultInstance().use { realm ->
                playerId?.let {
                    realm.where<Player>().equalTo("id", it).findFirst()?.let { player ->
                        realm.executeTransaction {
                            realm.copyToRealmOrUpdate(player.apply {
                                val device = Device()
                                device.name = element.name
                                device.bleMAC = element.address
                                leftDevice = device
                            })
                        }
                    }
                    finish()

                }
            }
        }

        nextButton.setOnClickListener {
            if (BLEManager.connected()) {
                val intent = Intent(this, DevicePairSelectActivity::class.java)
                intent.putExtra("player_id", playerId)
                //intent.flags = Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP
                startActivity(intent)
                return@setOnClickListener
            }

            val builderInner = AlertDialog.Builder(this)
            builderInner.setTitle("Please connect")
            builderInner.setMessage("To continue pairing with devices is important to connect first. Please get near to the device you need and try to connect by selecting the items on the list.")
            builderInner.setPositiveButton("I understand") { dialog, which ->
                dialog.dismiss()
            }
            builderInner.show()
        }

        closeButton.setOnClickListener {
            finish()
        }

        updateScanButton()
        scanButton.setOnClickListener {
            //nextButton.visibility = View.GONE

            BLEManager.disconnectDevice({
                if (BLEManager.scanning) {
                    BLEManager.stopScanning()
                } else {
                    BLEManager.startScanning(3000)
                }
            }, 1000)
        }

        BLEManager.startScanning(3000)
        BLEManager.didFoundDevice = {

            discoveredDevices.add(it)
            discoveredDevices = ArrayList(discoveredDevices.distinctBy { it.address })

            val devices = discoveredDevices.filter { it.name != null }
            adapter.items = ArrayList(devices)
            adapter.notifyDataSetChanged()
        }

        it.ninespartans.xmanager.bluetooth.BLEManager.onStartScanning = {
            //circular_progress_bar.visibility = View.VISIBLE
            discoveredDevices.clear()
            adapter.items.clear()
            adapter.notifyDataSetChanged()
            updateScanButton()
        }

        it.ninespartans.xmanager.bluetooth.BLEManager.onStopScanning = {
            //circular_progress_bar.visibility = View.GONE
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

        it.ninespartans.xmanager.bluetooth.BLEManager.stopScanning()
        it.ninespartans.xmanager.bluetooth.BLEManager.close()
    }

    override fun onBackPressed() {
        super.onBackPressed()
    }

    override fun onSupportNavigateUp(): Boolean {
        super.onBackPressed()
        return super.onSupportNavigateUp()
    }

    fun updateScanButton() {
        if (it.ninespartans.xmanager.bluetooth.BLEManager.scanning) {
            scanButton.text = "STOP SEARCHING"
            return
        }
        scanButton.text = "SEARCH DEVICES"
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
            return position.toLong()
        }

        override fun getItem(position: Int): Any {
            return items.get(position)
        }

        override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
            val rowDevice = inflater.inflate(it.ninespartans.xmanager.R.layout.row_device, viewGroup, false)

            val device = items.get(position)
            rowDevice.textViewName.text = device.name
            rowDevice.textViewMacAddress.text = device.address

            rowDevice.textViewPlayer.visibility = View.GONE
            rowDevice.textViewState.visibility = View.GONE

            Realm.getDefaultInstance().where<Player>()
                .equalTo("leftDevice.name", device.name)
                .equalTo("leftDevice.bleMAC", device.address)
                .findFirst()?.let { player ->

                    rowDevice.textViewPlayer.visibility = View.VISIBLE
                    rowDevice.textViewState.visibility = View.VISIBLE

                    rowDevice.textViewPlayer.text = player.name
                    rowDevice.textViewState.text = "PAIRED LEFT"
                }

            Realm.getDefaultInstance().where<Player>(Player::class.java)
                .equalTo("rightDevice.name", device.name)
                .equalTo("rightDevice.bleMAC", device.address)
                .findFirst()?.let { player ->

                    rowDevice.textViewPlayer.visibility = View.VISIBLE
                    rowDevice.textViewState.visibility = View.VISIBLE

                    rowDevice.textViewPlayer.text = player.name
                    rowDevice.textViewState.text = "PAIRED RIGHT"
                }

            return rowDevice
        }
    }

}
