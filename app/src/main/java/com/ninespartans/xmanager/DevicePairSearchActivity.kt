package com.ninespartans.xmanager

import android.app.AlertDialog
import android.app.Dialog
import android.bluetooth.*
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.LayerDrawable
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_device_pair_search.*
import kotlinx.android.synthetic.main.content_device_pair_search.*
import kotlinx.android.synthetic.main.row_device.view.*
import android.os.*
import android.util.DisplayMetrics
import com.google.android.material.bottomsheet.BottomSheetDialog
import io.realm.Realm
import io.realm.kotlin.where
import com.ninespartans.xmanager.bluetooth.BLEManager
import kotlin.collections.ArrayList
import com.google.android.material.button.MaterialButton
import com.google.gson.Gson
import io.realm.Case
import com.ninespartans.xmanager.model.Device
import com.ninespartans.xmanager.model.DeviceInfo
import com.ninespartans.xmanager.model.User
import kotlinx.android.synthetic.main.content_device_pair_search.closeButton
import org.bson.types.ObjectId


class DevicePairSearchActivity : AppCompatActivity() {
    private var discoveredDevices: ArrayList<BluetoothDevice> = ArrayList()
    private lateinit var adapter: DeviceAdapter
    private var deviceInfo: DeviceInfo? = null
    private var user: User? = null
    var userId: String? = null
    val debug = true
    var bottomSheetDialog: BottomSheetDialog? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_search)
        setSupportActionBar(toolbar)

        userId = intent.getStringExtra("user_id")

        /** Show Player Name */
        var realm = Realm.getDefaultInstance()
        realm.where<User>()
            .equalTo("_id", ObjectId(userId))
            .findFirst()?.let {
                this.user = it
                deviceSearchTitle.text = it.fullname
            }

        adapter = DeviceAdapter(this)
        adapter.items = ArrayList()
        list_view.adapter = adapter
        list_view.setOnItemClickListener { parent, view, position, id ->
            if (bottomSheetDialog?.isShowing == true) {
                return@setOnItemClickListener
            }
            presentBottomSheet(position)
        }

        updateSearchDevicesButton()
        searchDevicesButton.setOnClickListener {
            BLEManager.disconnectDevice({
                if (!BLEManager.scanning) {
                    BLEManager.startScanning(3000)
                }
            }, 1000)
        }

        debugButton.visibility = if (debug) View.VISIBLE else View.GONE
        debugButton.setOnClickListener {
            if (BLEManager.connected()) {
                val intent = Intent(this, DevicePairSelectActivity::class.java)
                intent.putExtra("user_id", userId)
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

        closeButton.visibility = if (debug) View.VISIBLE else View.GONE
        closeButton.setOnClickListener {
            finish()
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
            updateSearchDevicesButton()
        }

        BLEManager.onStopScanning = {
            //circular_progress_bar.visibility = View.GONE
            updateSearchDevicesButton()
        }
    }

    override fun onStart() {
        super.onStart()

        if (BLEManager.canStart(this) == false) {
            val intent = Intent(this, PermissionsManagerActivity::class.java)
            startActivity(intent)
            finish()
        }

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

    fun updateSearchDevicesButton() {
        if (BLEManager.scanning) {
            searchDevicesButton.text = "SEARCHING..."
            return
        }
        searchDevicesButton.text = "SEARCH DEVICES"
    }

    fun presentBottomSheet(position: Int) {
        var activeSaveButton = false
        var leftSelected = false
        var rightSelected = false

        /** Present BottomSheetDialog */
        bottomSheetDialog = BottomSheetDialog(this)
        bottomSheetDialog?.setContentView(R.layout.content_device_pair_bottom_sheet)
        bottomSheetDialog?.behavior?.isDraggable = false

        val title = bottomSheetDialog?.findViewById<TextView>(R.id.title)
        val description = bottomSheetDialog?.findViewById<TextView>(R.id.description)
        title?.text = getString(R.string.activity_device_search_sheet_connecting)
        description?.text = getString(R.string.activity_device_search_sheet_connecting_description)

        val leftShoeImage = bottomSheetDialog?.findViewById<ImageView>(R.id.leftShoeImage)
        val rightShoeImage = bottomSheetDialog?.findViewById<ImageView>(R.id.rightShoeImage)

        val chooseFootRadioGroup = bottomSheetDialog?.findViewById<RadioGroup>(R.id.chooseFootRadioGroup)
        val leftFootRadioButton = bottomSheetDialog?.findViewById<RadioButton>(R.id.left_foot)
        val rightFootRadioButton = bottomSheetDialog?.findViewById<RadioButton>(R.id.right_foot)

        chooseFootRadioGroup?.setOnCheckedChangeListener { radioGroup, i ->

        }

        leftShoeImage?.setOnClickListener {
            leftFootRadioButton?.isChecked = true

            if (!leftSelected) {
                leftSelected = true
                leftShoeImage?.setImageResource(R.drawable.left)
            }
            rightSelected = false
            rightShoeImage?.setImageResource(R.drawable.right_unactive)
            activeSaveButton = (leftSelected || rightSelected) && (deviceInfo?.ble?.mac?.isEmpty() == false)
        }

        rightShoeImage?.setOnClickListener {
            rightFootRadioButton?.isChecked = true

            if (!rightSelected) {
                rightSelected = true
                rightShoeImage?.setImageResource(R.drawable.right)
            }
            leftSelected = false
            leftShoeImage?.setImageResource(R.drawable.left_unactive)
            activeSaveButton = (leftSelected || rightSelected) && (deviceInfo?.ble?.mac?.isEmpty() == false)
        }
        bottomSheetDialog?.show()

        /**
         * Hack to color the bottom system bar
         */
        bottomSheetDialog?.let {
            setWhiteNavigationBar(it)
        }

        /**
         * Stop Bluetooth scanning
         * Select bluetooth device
         * Disconnect device if connected
         * Connect to device again
         * Listen when services are discovered and enable reading
         * On characteristic read, get all data and stop reading
         */
        BLEManager.stopScanning()
        val device = adapter.getItem(position) as BluetoothDevice
        BLEManager.selectDevice(device)
        BLEManager.disconnectDevice({
            BLEManager.connectDevice(this)
        }, 2000)
        BLEManager.onServiceDiscovered = {
            BLEManager.enableReading()
        }
        BLEManager.onCharacteristicRead = {
            title?.text = getString(R.string.activity_device_search_sheet_connected)

            val jsonString = it?.getStringValue(0)
            deviceInfo = Gson().fromJson<DeviceInfo>(jsonString, DeviceInfo::class.java)

            //val gson = GsonBuilder().setPrettyPrinting().create()
            //description?.text = gson.toJson(deviceInfo)
            BLEManager.disableReading()

            activeSaveButton = (leftSelected || rightSelected) && (deviceInfo?.ble?.mac?.isEmpty() == false)
        }

        val saveButton = bottomSheetDialog?.findViewById<MaterialButton>(R.id.saveButton)
        saveButton?.setOnClickListener {
            if (!activeSaveButton)  {
                return@setOnClickListener
            }

            /** Update player with the new device */
            Realm.getDefaultInstance().use { realm ->
                realm.executeTransaction {
                    user?.let {
                        val bleDevice = realm.where<Device>().equalTo("ble_mac", device.address, Case.INSENSITIVE).findFirst()
                        bleDevice?.let { device ->
                            user?.let { player ->
                                deviceInfo?.let {
                                    device.name = it.name
                                    device.firmwareVersion = it.version
                                    device.mac = it.efuse_mac
                                    device.ble_mac = it.ble.mac
                                    device.wifi_mac = it.wifi.mac

                                    /**
                                     * Save left device to current player
                                     * Check if other player is using this device
                                     * As left device or right device
                                     * Delete from other player
                                     */

                                    /** Fix This **/

                                    /*
                                        realm.where<User>()
                                            .equalTo("leftDevice.ble_mac", device.ble_mac)
                                            .or()
                                            .equalTo("rightDevice.ble_mac", device.ble_mac)
                                            .findAll()?.let {

                                                it.forEach {
                                                    if (it.leftDevice?.ble_mac == device.ble_mac) {
                                                        it.leftDevice = null
                                                    }
                                                    if (it.rightDevice?.ble_mac == device.ble_mac) {
                                                        it.rightDevice = null
                                                    }
                                                }
                                            }*/
/*
                                    if (leftSelected) {
                                        player.leftDevice = device
                                        if (player.rightDevice?.ble_mac == device.ble_mac)
                                            player.rightDevice = null
                                    }

                                    if (rightSelected) {
                                        if (player.leftDevice?.ble_mac == device.ble_mac)
                                            player.leftDevice = null
                                        player.rightDevice = device
                                    }
*/
                                }
                            }
                        } ?: run {
                            user?.let {
                                val device = realm.copyToRealmOrUpdate(Device().apply {
                                    deviceInfo?.let {
                                        name = it.name
                                        firmwareVersion = it.version
                                        mac = it.efuse_mac
                                        ble_mac = it.ble.mac
                                        wifi_mac = it.wifi.mac
                                    }
                                })
                            /** Fix this */
                            /*
                                if (leftSelected) {
                                    it.leftDevice = device
                                    it.rightDevice = null
                                }

                                if (rightSelected) {
                                    it.leftDevice = null
                                    it.rightDevice = device
                                }*/
                            }
                        }
                    }

                    bottomSheetDialog?.hide()
                    updateList()
                }
            }
        }
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
            rowDevice.textViewDeviceName.text = device.name
            rowDevice.textViewMacAddress.text = "MAC: " + device.address
            rowDevice.textViewPlayer.visibility = View.GONE
            rowDevice.leftShoeImage?.setImageResource(R.drawable.left_unactive)
            rowDevice.rightShoeImage?.setImageResource(R.drawable.right_unactive)

            Realm.getDefaultInstance().use {
                /*
                it.where<User>()
                    .equalTo("leftDevice.name", device.name)
                    .equalTo("leftDevice.ble_mac", device.address, Case.INSENSITIVE)
                    .findFirst()?.let { player ->
                        rowDevice.textViewPlayer.visibility = View.VISIBLE
                        rowDevice.textViewPlayer.text = "Player: " + player.fullname
                        rowDevice.leftShoeImage?.setImageResource(R.drawable.left)
                    }
                it.where<User>()
                    .equalTo("rightDevice.name", device.name)
                    .equalTo("rightDevice.ble_mac", device.address, Case.INSENSITIVE)
                    .findFirst()?.let { player ->
                        rowDevice.textViewPlayer.visibility = View.VISIBLE
                        rowDevice.textViewPlayer.text = "Player: " + player.fullname
                        rowDevice.rightShoeImage?.setImageResource(R.drawable.right)
                    }*/
            }

            return rowDevice
        }
    }

    private fun setWhiteNavigationBar(dialog: Dialog) {
        val window = dialog.getWindow()
        if (window != null) {
            val metrics = DisplayMetrics()
            window!!.getWindowManager().getDefaultDisplay().getMetrics(metrics)

            val dimDrawable = GradientDrawable()

            val navigationBarDrawable = GradientDrawable()
            navigationBarDrawable.shape = GradientDrawable.RECTANGLE
            navigationBarDrawable.setColor(Color.WHITE)// Set color here

            val layers = arrayOf<Drawable>(dimDrawable, navigationBarDrawable)

            val windowBackground = LayerDrawable(layers)
            windowBackground.setLayerInsetTop(1, metrics.heightPixels)

            window!!.setBackgroundDrawable(windowBackground)
        }
    }

    fun updateList() {
        BLEManager.disconnectDevice({
            if (!BLEManager.scanning) {
                BLEManager.startScanning(3000)
            }
        }, 1000)
    }

}