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
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.android.synthetic.main.content_device_search.*
import org.bson.types.ObjectId
import com.ninespartans.xmanager.adapters.DeviceSearchAdapter
import com.ninespartans.xmanager.common.Common


class DeviceSearchActivity : AppCompatActivity() {
    private val realm = Realm.getDefaultInstance()
    private var discoveredDevices: ArrayList<BluetoothDevice> = ArrayList()
    private lateinit var adapter: DeviceSearchAdapter
    private var deviceInfo: DeviceInfo? = null
    private var user: User? = null
    var userId: String? = null
    val debug = true
    var bottomSheetDialog: BottomSheetDialog? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_search)
        setSupportActionBar(toolbar)

        userId = intent.getStringExtra("user_id")

        /** Show Player Name */
        val user = realm.where<User>()
        user.equalTo("_id", ObjectId(userId))
        user.findFirst()?.let {
            this.user = it
            deviceSearchTitle.text = it.fullname
        }

        adapter = DeviceSearchAdapter(this)
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
                val intent = Intent(this, BluetoothDebugActivity::class.java)
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

        if (!BLEManager.canStart(this)) {
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

        chooseFootRadioGroup?.setOnCheckedChangeListener { group, checkedId ->
            val radioButton = checkedId?.let { bottomSheetDialog?.findViewById<RadioButton>(it) }
            when (radioButton?.text.toString()) {
                getString(R.string.activity_device_search_sheet_radio_left_foot) -> {
                    if (!leftSelected) {
                        leftSelected = true
                        leftShoeImage?.setImageResource(R.drawable.left)
                    }
                    rightSelected = false
                    rightShoeImage?.setImageResource(R.drawable.right_unactive)
                    activeSaveButton = (leftSelected || rightSelected) && (deviceInfo?.ble?.mac?.isEmpty() == false)
                }
                getString(R.string.activity_device_search_sheet_radio_right_foot) -> {
                    if (!rightSelected) {
                        rightSelected = true
                        rightShoeImage?.setImageResource(R.drawable.right)
                    }
                    leftSelected = false
                    leftShoeImage?.setImageResource(R.drawable.left_unactive)
                    activeSaveButton = (leftSelected || rightSelected) && (deviceInfo?.ble?.mac?.isEmpty() == false)
                }
            }
        }

        leftShoeImage?.setOnClickListener {
            leftFootRadioButton?.isChecked = true

            if (!leftSelected) {
                leftSelected = true
                leftShoeImage.setImageResource(R.drawable.left)
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

        /** Workaround to color the bottom system bar */
        bottomSheetDialog?.let { Common.setWhiteNavigationBar(it) }

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

            /** Update Device */
            realm.executeTransaction {

                /** Delete devices with same BLE MAC Address */
                it.where<Device>()
                    .equalTo("ble_mac", deviceInfo?.ble?.mac)
                    .findAll().forEach { device ->
                        device.deleteFromRealm()
                    }

                /** Dave new device */
                it.copyToRealmOrUpdate(Device().apply {
                    deviceInfo?.let { deviceInfo ->
                        name = deviceInfo.name
                        version = deviceInfo.version
                        if (leftSelected) { deviceType = Device.DeviceType.SHOE_LEFT }
                        if (rightSelected) { deviceType = Device.DeviceType.SHOE_RIGHT }
                        mac = deviceInfo.efuse_mac
                        ble_mac = deviceInfo.ble.mac
                        wifi_mac = deviceInfo.wifi.mac
                        user = this@DeviceSearchActivity.user
                    }
                    bottomSheetDialog?.hide()
                    updateList()
                })
            }
        }
    }


    private fun updateList() {
        BLEManager.disconnectDevice({
            if (!BLEManager.scanning) {
                BLEManager.startScanning(3000)
            }
        }, 1000)
    }

}
