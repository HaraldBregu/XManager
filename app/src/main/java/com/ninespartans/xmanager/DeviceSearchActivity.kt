package com.ninespartans.xmanager

import android.app.AlertDialog
import android.bluetooth.*
import android.content.Context
import android.content.Intent
import android.location.LocationManager
import android.view.View
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import android.os.*
import android.util.Log
import com.google.android.material.bottomsheet.BottomSheetDialog
import io.realm.Realm
import io.realm.kotlin.where
import com.ninespartans.xmanager.bluetooth.BLEManager
import kotlin.collections.ArrayList
import com.google.android.material.button.MaterialButton
import com.google.gson.Gson
import com.ninespartans.xmanager.model.Device
import com.ninespartans.xmanager.model.DeviceInfo
import com.ninespartans.xmanager.model.User
import org.bson.types.ObjectId
import com.ninespartans.xmanager.adapters.DeviceSearchAdapter
import com.ninespartans.xmanager.common.Common
import com.ninespartans.xmanager.databinding.ActivityDeviceSearchBinding


class DeviceSearchActivity : AppCompatActivity() {
    private lateinit var binding: ActivityDeviceSearchBinding
    private val realm = Realm.getDefaultInstance()
    private var discoveredDevices: ArrayList<BluetoothDevice> = ArrayList()
    private lateinit var adapter: DeviceSearchAdapter
    private var deviceInfo: DeviceInfo? = null
    private var user: User? = null
    var userId: String? = null
    private val debug = false
    var bottomSheetDialog: BottomSheetDialog? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityDeviceSearchBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        userId = intent.getStringExtra("user_id")

        /** Show Player Name */
        val user = realm.where<User>()
        user.equalTo("_id", ObjectId(userId))
        user.findFirst()?.let {
            this.user = it
            binding.content.deviceSearchTitle.text = it.fullname
        }

        adapter = DeviceSearchAdapter(this)
        adapter.items = ArrayList()
        binding.content.listView.adapter = adapter
        binding.content.listView.setOnItemClickListener { parent, view, position, id ->
            if (bottomSheetDialog?.isShowing == true) {
                return@setOnItemClickListener
            }
            presentBottomSheet(position)
        }

        updateSearchDevicesButton()
        binding.content.searchDevicesButton.setOnClickListener {
            BLEManager.disconnectDevice({
                if (!BLEManager.scanning) {
                    BLEManager.startScanning(3000)
                }
            }, 1000)
        }

        binding.content.debugButton.visibility = if (debug) View.VISIBLE else View.GONE
        binding.content.debugButton.setOnClickListener {
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

        binding.content.closeButton.visibility = if (debug) View.VISIBLE else View.GONE
        binding.content.closeButton.setOnClickListener {
            finish()
        }

        BLEManager.startScanning(3000)
        BLEManager.didFoundDevice = {
            discoveredDevices.add(it)
            discoveredDevices = ArrayList(discoveredDevices.distinctBy {
                it.address
            })
            val devices = discoveredDevices.filter {
                it.name != null
            }
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
        if (!BLEManager.canStart(this)) {
            return
        }

        if (BLEManager.scanning) {
            binding.content.searchDevicesButton.text = "SEARCHING..."
            return
        }
        binding.content.searchDevicesButton.text = "SEARCH DEVICES"
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
