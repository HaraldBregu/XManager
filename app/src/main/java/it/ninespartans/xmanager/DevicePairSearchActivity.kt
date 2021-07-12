package it.ninespartans.xmanager

import android.app.AlertDialog
import android.bluetooth.*
import android.content.Context
import android.content.Intent
import android.graphics.Color
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
import com.google.android.material.bottomsheet.BottomSheetBehavior
import com.google.android.material.bottomsheet.BottomSheetDialog
import io.realm.Realm
import io.realm.kotlin.where
import it.ninespartans.xmanager.bluetooth.BLEManager
import it.ninespartans.xmanager.model.Player
import it.ninespartans.xmanager.model.Device
import kotlin.collections.ArrayList
import java.nio.file.Files.delete
import android.widget.LinearLayout
import androidx.core.app.ComponentActivity.ExtraData
import androidx.core.content.ContextCompat.getSystemService
import android.icu.lang.UCharacter.GraphemeClusterBreak.T
import android.util.Log
import androidx.core.content.ContextCompat
import com.google.android.material.button.MaterialButton
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import it.ninespartans.xmanager.model.DeviceInfo
import kotlinx.android.synthetic.main.content_device_pair_search.closeButton
import kotlinx.android.synthetic.main.content_device_pair_select.*


class DevicePairSearchActivity : AppCompatActivity() {
    private var discoveredDevices: ArrayList<BluetoothDevice> = ArrayList()
    private lateinit var adapter: DeviceAdapter
    var playerId: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_search)
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

        adapter = DeviceAdapter(this)
        adapter.items = ArrayList()
        list_view.adapter = adapter
        list_view.setOnItemClickListener { parent, view, position, id ->

            /**
             * BottomSheetDialog
             */
            val bottomSheetDialog = BottomSheetDialog(this)
            bottomSheetDialog.setContentView(R.layout.content_device_pair_bottom_sheet)
            bottomSheetDialog.behavior.isDraggable = false

            val title = bottomSheetDialog.findViewById<TextView>(R.id.title)
            title?.text = "Connectin to device..."

            val description = bottomSheetDialog.findViewById<TextView>(R.id.description)
            description?.text = "Descrizione di questa..."

            var leftSelected = false
            var rightSelected = false
            val leftShoeImage = bottomSheetDialog.findViewById<ImageView>(R.id.leftShoeImage)
            val rightShoeImage = bottomSheetDialog.findViewById<ImageView>(R.id.rightShoeImage)

            leftShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.unselectedShoeColor))
            leftShoeImage?.setOnClickListener {
                leftShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.unselectedShoeColor))
                rightShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.unselectedShoeColor))
                rightSelected = false

                if (!leftSelected) {
                    rightShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.unselectedShoeColor))
                    leftShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.selectedShoeColor))
                }

                leftSelected = !leftSelected
            }

            rightShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.unselectedShoeColor))
            rightShoeImage?.setOnClickListener {
                leftShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.unselectedShoeColor))
                rightShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.unselectedShoeColor))
                leftSelected = false

                if (!rightSelected) {
                    leftShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.unselectedShoeColor))
                    rightShoeImage?.setColorFilter(ContextCompat.getColor(this, R.color.selectedShoeColor))
                }

                rightSelected = !rightSelected
            }

            bottomSheetDialog.show()


            //nextButton.visibility = View.GONE
            //nextButton.isEnabled = false
            BLEManager.stopScanning()

            val element = adapter.getItem(position) as BluetoothDevice
            BLEManager.selectDevice(element)
            // Before connecting to new device,
            // disconnect to old devices if available.
            BLEManager.disconnectDevice({
                BLEManager.connectDevice(this)
                //nextButton.visibility = View.VISIBLE
                //nextButton.isEnabled = true
            }, 2000)


            BLEManager.onConnectionStateChange = { state, newState ->
                if (state == BluetoothGatt.GATT_SUCCESS) {
                    Log.i("state", "success")

                    if (newState == BluetoothProfile.STATE_CONNECTED) {
                        Log.i("newState", "Connected")
                        //title?.text = "Connected"
                    }
                    if (newState == BluetoothProfile.STATE_DISCONNECTED) {
                        Log.i("newState", "disconnected")
                    }
                } else {
                    Log.i("state", "unsuccess")
                }
            }

            BLEManager.onServiceDiscovered = {
                Log.i("SERVICE_DISCOVERED_b", "Connected")
                BLEManager.enableReading()
            }

            BLEManager.onCharacteristicRead = {
                Log.i("SERVICE_DISCOVERED_2", "chars")
                title?.text = "Connected"

                val jsonString = it?.getStringValue(0)
                val deviceInfo = Gson().fromJson<DeviceInfo>(jsonString, DeviceInfo::class.java)

                val gson = GsonBuilder().setPrettyPrinting().create()
                description?.text = gson.toJson(deviceInfo)

                BLEManager.disableReading()
            }

            val saveButton = bottomSheetDialog.findViewById<MaterialButton>(R.id.saveButton)
            saveButton?.setOnClickListener {
                Log.i("SAVE_BUTTON", "chars")


                /**
                 * Show
                 * Update player with the new device
                 */
                /*
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
                */

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

        BLEManager.onStartScanning = {
            //circular_progress_bar.visibility = View.VISIBLE
            discoveredDevices.clear()
            adapter.items.clear()
            adapter.notifyDataSetChanged()
            updateScanButton()
        }

        BLEManager.onStopScanning = {
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
            val rowDevice = inflater.inflate(R.layout.row_device, viewGroup, false)

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
