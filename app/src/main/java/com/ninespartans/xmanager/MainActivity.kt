package com.ninespartans.xmanager

import android.animation.ArgbEvaluator
import android.animation.ValueAnimator
import android.app.AlertDialog
import android.bluetooth.BluetoothGatt
import android.bluetooth.BluetoothProfile
import android.content.Intent
import android.os.*
import android.view.*
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import com.ninespartans.xmanager.bluetooth.BLEManager
import android.widget.*
import com.google.android.material.bottomsheet.BottomSheetDialog
import io.realm.RealmResults
import io.realm.kotlin.where
import com.ninespartans.xmanager.adapters.MainListAdapter
import com.ninespartans.xmanager.model.DeviceProgram
import com.ninespartans.xmanager.adapters.ProgramSelectAdapter
import com.ninespartans.xmanager.model.User
import com.ninespartans.xmanager.common.Common
import java.util.*
import android.os.Bundle
import com.ninespartans.xmanager.databinding.ActivityMainBinding
import com.ninespartans.xmanager.model.Account
import com.ninespartans.xmanager.model.Device


class MainActivity : AppCompatActivity() {
    private lateinit var binding: ActivityMainBinding
    private lateinit var adapter: MainListAdapter
    private var programUploaded:Boolean = false
    private lateinit var bottomSheetDialog: BottomSheetDialog
    private var uploadProgressProgram: ProgressBar? = null
    private var animator: ValueAnimator = ValueAnimator()
    private val realm: Realm = Realm.getDefaultInstance()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityMainBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        title = " " + getString(R.string.activity_main_title)
        //supportActionBar?.setIcon(R.drawable.home_nav_bar_icon)
        //supportActionBar?.setDisplayShowHomeEnabled(true)

        adapter = MainListAdapter(this)
        binding.content.listView.adapter = adapter
        adapter.onClickAction = {
            when (it) {
                MainListAdapter.Action.EDIT_ACCOUNT -> {
                    val intent = Intent(this, EditAccountActivity::class.java)
                    startActivity(intent)
                }
                MainListAdapter.Action.SHOW_ACCOUNT -> {
                    val intent = Intent(this, AccountActivity::class.java)
                    startActivity(intent)
                }
                MainListAdapter.Action.STOP_PROGRAM -> {
                    val builderInner = AlertDialog.Builder(this)
                    builderInner.setTitle("Termina programma")
                    builderInner.setMessage("Sei sicuro di voler terminare il programma di allenamento in corso?")
                    builderInner.setNegativeButton("Annulla") { dialog, which ->
                        dialog.dismiss()
                    }
                    builderInner.setPositiveButton("Termina") { dialog, which ->
                        val programs = realm.where<DeviceProgram>().findAll()
                        realm.executeTransaction { realm ->
                            programs.forEach {
                                val calendar = Calendar.getInstance()
                                calendar.add(Calendar.YEAR, -1)
                                it.startDate = calendar.time
                            }
                        }

                        adapter.updateData()
                    }
                    builderInner.show()
                }
                MainListAdapter.Action.SHOW_PROGRAM -> {
                    val intent = Intent(this, ProgramListActivity::class.java)
                    startActivity(intent)
                }
                MainListAdapter.Action.CREATE_PROGRAM -> {
                    val intent = Intent(this, CreateProgramActivity::class.java)
                    startActivity(intent)
                }
                MainListAdapter.Action.UPLOAD_PROGRAM -> {
                    presentProgramsListBottomSheet()
                }
                MainListAdapter.Action.ADD_PLAYER -> {
                    val intent = Intent(this, CreateUserActivity::class.java)
                    startActivity(intent)
                }
                else ->  { }
            }
        }
        adapter.onClickActionOnItem = { action, user ->
            when (action) {
                MainListAdapter.Action.EDIT_PLAYER -> {
                    val intent = Intent(this, CreateUserActivity::class.java)
                    intent.putExtra("user_id", user._id.toString())
                    startActivity(intent)
                }
                MainListAdapter.Action.UPLOAD_PROGRAM -> {
                    presentProgramsListBottomSheet(user)
                }
                MainListAdapter.Action.REGISTER_DEVICE -> {
                    val intent = Intent(this, DeviceSearchActivity::class.java)
                    val id = user._id.toString()
                    intent.putExtra("user_id",id)
                    startActivity(intent)
                }
                MainListAdapter.Action.DELETE_DEVICES -> {
                    val devices = realm.where<Device>()
                    devices.isNotNull("user")
                    devices.equalTo("user._id", user._id)
                    realm.executeTransaction {
                        devices.findAll().deleteAllFromRealm()
                        adapter.updateData()
                    }
                }
                MainListAdapter.Action.DELETE_PLAYER -> {
                    realm.executeTransaction {
                        user.deleteFromRealm()
                        adapter.updateData()
                    }
                }

                else -> {}
            }
        }
        adapter.onClickActionOnDeviceItem = { action, device ->
            when (action) {
                MainListAdapter.Action.SELECT_DEVICE -> {
                    val intent = Intent(this, DeviceActivity::class.java)
                    val id = device._id.toString()
                    intent.putExtra("device_id", id)
                    startActivity(intent)
                }
                else -> {}
            }
        }

        /** Option button */
        binding.content.uploadProgramButton.visibility = View.GONE
        binding.content.uploadProgramButton.setOnClickListener {
            /*val popupMenu = PopupMenu(this, it)
            popupMenu.menuInflater.inflate(R.menu.popup_fab_main, popupMenu.menu)
            popupMenu.setOnMenuItemClickListener {
                when (it.itemId) {
                    R.id.action_create_program ->
                        startActivity(Intent(this, CreateProgramActivity::class.java))
                    R.id.action_create_player ->
                        startActivity(Intent(this, CreateUserActivity::class.java))
                }
                true
            }
            popupMenu.show()
            */
        }
    }

    override fun onStart() {
        super.onStart()

        adapter.updateData()
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        //menuInflater.inflate(R.menu.menu_main, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.action_profile -> {
                val intent = Intent(this, EditAccountActivity::class.java)
                startActivity(intent)
                return true
            }
            android.R.id.home -> {
                val intent = Intent(this, EditAccountActivity::class.java)
                startActivity(intent)
                return true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

    /** Present list of programs to select */
    private fun presentProgramsListBottomSheet(user: User? = null) {

        val account = realm.where<Account>().findFirst()
        val tmpusers = realm.where<User>()
        account?.let {
            tmpusers.notEqualTo("account._id", it._id)
        }
        user?.let {
            tmpusers.equalTo("_id", user._id)
        }
        val users = tmpusers.findAll()

        /** When there are no users registered */
        if (users.isEmpty()) {
            val builderInner = AlertDialog.Builder(this)
            builderInner.setTitle("Attenzione!")
            builderInner.setMessage("Non hai nessun giocatore registrato. Inizia a crearne uno e associa i device.")
            builderInner.setNegativeButton("Chiudi") { dialog, which ->
                dialog.dismiss()
            }
            builderInner.setPositiveButton("Crea giocatore") { dialog, which ->
                dialog.dismiss()
                startActivity(Intent(this, CreateUserActivity::class.java))
            }
            builderInner.show()
            return
        }

        val devices = realm.where<Device>()
            .isNotNull("user")
            .equalTo("active", true)
            .sort("user._id")
            .findAll()

        /** When there are no devices registered */
        if (devices.isEmpty()) {
            val builderInner = AlertDialog.Builder(this)
            builderInner.setTitle("Attenzione!")
            builderInner.setMessage("Non hai nessun dispositivo registrato o attivato. Inizia a crearne uno e associa i dispositivi.")
            builderInner.setNegativeButton("Chiudi") { dialog, which ->
                dialog.dismiss()
            }
            builderInner.setPositiveButton("Associa dispositivo") { dialog, which ->
                dialog.dismiss()
                startActivity(Intent(this, CreateUserActivity::class.java))
            }
            builderInner.show()
            return
        }

        val programs = realm.where<DeviceProgram>().findAll()


        /** Bottom sheet dialog */
        val bottomSheetDialog = BottomSheetDialog(this)
        bottomSheetDialog.setContentView(R.layout.content_program_select_bottom_sheet)
        val adapter = ProgramSelectAdapter(this, programs)
        val listView = bottomSheetDialog.findViewById<ListView>(R.id.list_view)
        listView?.isNestedScrollingEnabled = true
        listView?.adapter = adapter
        listView?.setOnItemClickListener { _, _, position, _ ->
            val program = programs[position]
            bottomSheetDialog.hide()
            adapter.notifyDataSetChanged()
            program?.let { presentBottomSheetDialogUploader(it, devices) }
        }

        bottomSheetDialog.show()
        Common.setWhiteNavigationBar(bottomSheetDialog)
    }

    /** BottomSheet Dialog Program Uploader */
    private fun presentBottomSheetDialogUploader(deviceProgram: DeviceProgram, devices: RealmResults<Device>, deviceIndex: Int = 0) {

        /** BottomSheet Dialog */
        bottomSheetDialog = BottomSheetDialog(this)
        bottomSheetDialog.setContentView(R.layout.content_upload_program_bottom_sheet)
        bottomSheetDialog.behavior.isDraggable = false
        bottomSheetDialog.setCancelable(false)
        Common.setWhiteNavigationBar(bottomSheetDialog)

        /** Title, Description */
        val title = bottomSheetDialog.findViewById<TextView>(R.id.title)
        title?.text = getString(R.string.upload_program_sheet_title)
        val description = bottomSheetDialog.findViewById<TextView>(R.id.description)
        description?.text = getString(R.string.upload_program_sheet_description)

        /** Progress */
        uploadProgressProgram = bottomSheetDialog.findViewById<ProgressBar>(R.id.uploadProgressProgram)
        uploadProgressProgram?.max = 100
        uploadProgressProgram?.setProgress(0)
        bottomSheetDialog.show()

        /** Upload */
        uploadProgramToDevice(deviceProgram, devices, deviceIndex)
    }

    private fun uploadProgramToDevice(deviceProgram: DeviceProgram, devices: RealmResults<Device>, deviceIndex: Int = 0) {

        /** When there are no more devices return */
        if (deviceIndex >= devices.size) {
            bottomSheetDialog.hide()
            return
        }

        val device = devices[deviceIndex]

        bottomSheetDialog.setCancelable(true)
        uploadProgressProgram?.progress = 0

        /** Get Device BLE MAC Address */
        device?.ble_mac?.let { BLEManager.getDevice(it.uppercase(Locale.ROOT)) }

        val playerNameTextView = bottomSheetDialog.findViewById<TextView>(R.id.playerNameTextView)
        playerNameTextView?.text = device?.user?.fullname
        val descriptionProgress = bottomSheetDialog.findViewById<TextView>(R.id.progressBarTitle)
        descriptionProgress?.text = getString(R.string.upload_program_sheet_state_initial_title)
        val leftShoeImage = bottomSheetDialog.findViewById<ImageView>(R.id.leftShoeImage)
        leftShoeImage?.setColorFilter(R.color.colorPrimaryLight)
        val rightShoeImage = bottomSheetDialog.findViewById<ImageView>(R.id.rightShoeImage)
        rightShoeImage?.setColorFilter(R.color.colorPrimaryLight)

        animator.removeAllUpdateListeners()
        animator.removeAllListeners()
        if (animator.isStarted) { animator.end() }
        animator.cancel()
        animator.setIntValues(getColor(R.color.colorPrimaryLight), getColor(R.color.colorPrimaryVariant))
        animator.setEvaluator(ArgbEvaluator())
        animator.addUpdateListener {
            val animatedValue = animator.animatedValue as Int
            leftShoeImage?.setColorFilter(animatedValue)
            rightShoeImage?.setColorFilter(animatedValue)
        }
        animator.duration = 500
        animator.repeatCount = ValueAnimator.INFINITE
        animator.repeatMode = ValueAnimator.REVERSE
        animator.start()

        /** Disconnect and Connect to BLE */
        BLEManager.disconnectDevice({
            descriptionProgress?.text = getString(R.string.upload_program_sheet_state_connecting_title)
            uploadProgressProgram?.progress = 40
            BLEManager.connectDevice(this)
        }, 2000)

        /** Listen BLE connection changes */
        BLEManager.onConnectionStateChange = { gatt, status, newState ->
            if (status != BluetoothGatt.GATT_SUCCESS) {
                runOnUiThread {
                    descriptionProgress?.text = getString(R.string.upload_program_sheet_state_error_connection_title)
                }
                Handler(Looper.getMainLooper()).postDelayed({
                    this.uploadProgramToDevice(deviceProgram, devices, deviceIndex + 1)
                }, 2000)
            }
            when (newState) {
                BluetoothProfile.STATE_DISCONNECTED -> {
                    runOnUiThread {
                        if (!programUploaded) {
                            descriptionProgress?.text = getString(R.string.upload_program_sheet_state_disconnected_title)
                        }
                    }
                    Handler(Looper.getMainLooper()).postDelayed({
                        programUploaded = false
                        this.uploadProgramToDevice(deviceProgram, devices, deviceIndex + 1)
                    }, 2000)

                }
                BluetoothProfile.STATE_CONNECTED -> {
                    runOnUiThread {
                        descriptionProgress?.text = getString(R.string.upload_program_sheet_state_connected_title)
                        uploadProgressProgram?.setProgress(50)
                    }
                }
            }
        }

        /** Listen BLE services discovered and Start uploading program */
        BLEManager.onServiceDiscovered = {
            runOnUiThread {
                descriptionProgress?.text = getString(R.string.upload_program_sheet_state_writing_data_title)
                uploadProgressProgram?.progress = 80
                BLEManager.write(deviceProgram.programBytesDevice())
                realm.executeTransaction {
                    deviceProgram.startDate = Date()
                    device?.updatedAt = Date()
                    device?.program = deviceProgram
                    adapter.updateData()
                }
            }
        }

        /** Listen Data when are writed */
        BLEManager.onCharacteristicWrite = {
            runOnUiThread {
                descriptionProgress?.text = "Programma caricato"
                uploadProgressProgram?.progress = 100
                programUploaded = true
            }
            /** Disconnect device after writing */
            BLEManager.disconnectDevice()
        }
    }

}
