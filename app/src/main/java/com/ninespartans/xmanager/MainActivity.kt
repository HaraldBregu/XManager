package com.ninespartans.xmanager

import android.animation.ArgbEvaluator
import android.animation.ValueAnimator
import android.app.AlertDialog
import android.bluetooth.BluetoothGatt
import android.bluetooth.BluetoothProfile
import android.content.Intent
import android.os.*
import android.util.Log
import android.view.*
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import io.realm.Realm
import com.ninespartans.xmanager.bluetooth.BLEManager
import android.widget.*
import com.google.android.material.bottomsheet.BottomSheetDialog
import io.realm.RealmResults
import io.realm.kotlin.where
import com.ninespartans.xmanager.adapters.MainListAdapter
import com.ninespartans.xmanager.model.TrainingProgram
import com.ninespartans.xmanager.adapters.ProgramSelectAdapter
import com.ninespartans.xmanager.model.User
import com.ninespartans.xmanager.common.Common
import kotlinx.android.synthetic.main.content_main.*
import java.util.*
import android.os.Bundle


class MainActivity : AppCompatActivity() {
    private lateinit var adapter: MainListAdapter
    enum class Foot { LEFT, RIGHT }
    var programUploaded:Boolean = false
    lateinit var bottomSheetDialog: BottomSheetDialog
    var uploadProgressProgram: ProgressBar? = null
    var animator: ValueAnimator = ValueAnimator()
    val realm = Realm.getDefaultInstance()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
        title = getString(R.string.activity_main_title)

        adapter = MainListAdapter(this)
        list_view.adapter = adapter
        adapter.onClickAction = {
            when (it) {
                MainListAdapter.Action.STOP_PROGRAM -> {
                    val builderInner = AlertDialog.Builder(this)
                    builderInner.setTitle("Termina programma")
                    builderInner.setMessage("Sei sicuro di voler terminare il programma di allenamento in corso?")
                    builderInner.setNegativeButton("Annulla") { dialog, which ->
                        dialog.dismiss()
                    }
                    builderInner.setPositiveButton("Termina") { dialog, which ->
                        val programs = realm.where<TrainingProgram>().findAll()
                        realm.executeTransaction { realm ->
                            programs.forEach {
                                val calendar = Calendar.getInstance()
                                calendar.add(Calendar.YEAR, -1)
                                it.startDate = calendar.time
                            }
                        }
                        adapter.notifyDataSetChanged()
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
                    presentProgramBottomSheet()
                }
                MainListAdapter.Action.ADD_PLAYER -> {
                    val intent = Intent(this, CreateUserActivity::class.java)
                    startActivity(intent)
                }
            }
        }
        adapter.onClickActionOnItem = { action, user ->
            when (action) {
                MainListAdapter.Action.EDIT_PLAYER -> {
                    val intent = Intent(this, CreateUserActivity::class.java)
                    intent.putExtra("user_id", user._id.toString())
                    startActivity(intent)
                }
                MainListAdapter.Action.DELETE_PLAYER -> {
                    val builderInner = AlertDialog.Builder(this)
                    builderInner.setTitle("Attention!")
                    builderInner.setMessage("Before deleting the Player be sure that you don't need it anymore. All pairing devices and data will be deleted permanently from the app.")
                    builderInner.setNegativeButton("Cancel") { dialog, which ->
                        dialog.dismiss()
                    }
                    builderInner.setPositiveButton("Delete") { dialog, which ->
                        realm.executeTransaction {
                            //player.leftDevice?.deleteFromRealm()
                            //player.rightDevice?.deleteFromRealm()
                            user.deleteFromRealm()
                            adapter.notifyDataSetChanged()
                        }
                    }
                    builderInner.show()
                }
                MainListAdapter.Action.COMPLETE_DEVICES -> {
                    val intent = Intent(this, DevicePairSearchActivity::class.java)
                    val id = user._id.toString()
                    Log.e("USER_ID", id)
                    intent.putExtra("user_id",id)
                    startActivity(intent)
                }
                MainListAdapter.Action.DELETE_DEVICES -> {
                    realm.executeTransaction {
                        //player.leftDevice?.deleteFromRealm()
                        //player.rightDevice?.deleteFromRealm()
                        adapter.notifyDataSetChanged()
                    }
                }
                MainListAdapter.Action.UPLOAD_PROGRAM -> {
                    val intent = Intent(this, ProgramListActivity::class.java)
                    startActivity(intent)
                }
            }
        }

        /** Option button */
        fab.setOnClickListener {
            val popupMenu = PopupMenu(this, it)
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
        }

        /*
        val appSettingPrefs: SharedPreferences = getSharedPreferences("AppSettingPrefs", 0)
        val isNightModeOn: Boolean = appSettingPrefs.getBoolean("NightMode", false)

        if (isNightModeOn) {
            //AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES)
        } else {
            //AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_YES)
        }

        val currentNightMode = configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK
        when (currentNightMode) {
            Configuration.UI_MODE_NIGHT_NO -> {

            } // Night mode is not active, we're using the light theme
            Configuration.UI_MODE_NIGHT_YES -> {

            } // Night mode is active, we're using dark theme
        }*/
    }

    override fun onStart() {
        super.onStart()
        adapter.notifyDataSetChanged()
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_main, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.action_debug -> {
                val intent = Intent(this, DebugActivity::class.java)
                startActivity(intent)
                return true
            }
            R.id.action_profile -> {
                val intent = Intent(this, CreateAccountActivity::class.java)
                startActivity(intent)
                return true
            }
            android.R.id.home -> {
                val intent = Intent(this, CreateAccountActivity::class.java)
                startActivity(intent)
                return true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

    /**
     * Present list of programs to select
     */
    fun presentProgramBottomSheet() {
        var bottomSheetDialog = BottomSheetDialog(this)
        bottomSheetDialog.setContentView(R.layout.content_program_select_bottom_sheet)

        var realm = Realm.getDefaultInstance()
        val programs = realm.where<TrainingProgram>().findAll()

        var listView = bottomSheetDialog.findViewById<ListView>(R.id.list_view)
        listView?.isNestedScrollingEnabled = true

        var adapter = ProgramSelectAdapter(this, programs)
        listView?.adapter = adapter
        listView?.setOnItemClickListener { parent, view, position, id ->
            val selectedProgram = programs.get(position)

            realm.executeTransaction { realm ->
                programs.forEach { it.active = false }
                selectedProgram?.active = true
            }

            bottomSheetDialog.hide()
            adapter.notifyDataSetChanged()

            /**
             * Read Players that have at least 1 device connected
             * If there are no device connected to the players show an alert
             */
            var playersQuery = realm.where<User>()
            val allPlayers = playersQuery.findAll()

            val players = playersQuery
                .isNotNull("leftDevice")
                .or()
                .isNotNull("rightDevice")
                .findAll()

            /**
             * When there are no players registered
             */
            if (allPlayers.isEmpty()) {
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
                return@setOnItemClickListener
            }

            /**
             * When there are no players registered with devices
             */
            if (players.isEmpty()) {
                val builderInner = AlertDialog.Builder(this)
                builderInner.setTitle("Attenzione!")
                builderInner.setMessage("Sembra che i giocatori che hai registrato non hanno nessun dispositivo Bluetooth collegato! Inizia a collegare i dispositivi bluetooth con i giocatori e poi riprova a caricare il programma di allenamento.")
                builderInner.setPositiveButton("Riprova") { dialog, which ->
                    dialog.dismiss()
                }
                builderInner.show()
                return@setOnItemClickListener
            }

            selectedProgram?.let {
                presenBottomtSheetUploader(it, players)
            }
        }

        bottomSheetDialog?.show()
        Common.setWhiteNavigationBar(bottomSheetDialog)
    }

    fun presenBottomtSheetUploader(trainingProgram: TrainingProgram, players: RealmResults<User>, playerIndex: Int = 0, foot: Foot = Foot.LEFT) {
        if (playerIndex >= players.size) {
            startTrainingProgram(trainingProgram)
            return
        }

        bottomSheetDialog = BottomSheetDialog(this)
        bottomSheetDialog.setContentView(R.layout.content_upload_program_bottom_sheet)
        bottomSheetDialog.behavior?.isDraggable = false
        bottomSheetDialog.setCancelable(false)
        Common.setWhiteNavigationBar(bottomSheetDialog)

        /**
         * Title Sheet
         * Description Sheet
         */
        var title = bottomSheetDialog.findViewById<TextView>(R.id.title)
        var description = bottomSheetDialog.findViewById<TextView>(R.id.description)
        title?.text = getString(R.string.upload_program_sheet_title)
        description?.text = getString(R.string.upload_program_sheet_description)

        /**
         * ProgressBar
         */
        uploadProgressProgram = bottomSheetDialog.findViewById<ProgressBar>(R.id.uploadProgressProgram)
        uploadProgressProgram?.max = 100
        uploadProgressProgram?.setProgress(0)
        bottomSheetDialog?.show()

        uploadProgramToPlayer(trainingProgram, players, playerIndex, foot)
    }

    fun uploadProgramToPlayer(trainingProgram: TrainingProgram, users: RealmResults<User>, playerIndex: Int = 0, foot: Foot = Foot.LEFT) {
        val user = users[playerIndex]
        bottomSheetDialog.setCancelable(true)

        uploadProgressProgram?.setProgress(0)

        /** Fix */
        /**
         * Query for devices for this user and than upload the program
         */

        /*
        when (foot) {
            Foot.LEFT -> {

                user?.leftDevice?.let {
                    BLEManager.getDevice(it.ble_mac.toUpperCase())
                }?: run {
                    this.uploadProgramToPlayer(trainingProgram, players, playerIndex, Foot.RIGHT)
                    return
                }
            }
            Foot.RIGHT -> {
                player?.rightDevice?.let {
                    BLEManager.getDevice(it.ble_mac.toUpperCase())
                }?: run {
                    bottomSheetDialog?.hide()
                    this.presenBottomtSheetUploader(trainingProgram, players, playerIndex + 1, Foot.LEFT)
                    return
                }
            }
        }*/

        /**
         * Player Name
         * Progress Bar Title
         * ProgressBar
         * Left & Right Shoe Image
         */
        var playerNameTextView = bottomSheetDialog.findViewById<TextView>(R.id.playerNameTextView)
        var descriptionProgress = bottomSheetDialog.findViewById<TextView>(R.id.progressBarTitle)
        val leftShoeImage = bottomSheetDialog.findViewById<ImageView>(R.id.leftShoeImage)
        val rightShoeImage = bottomSheetDialog.findViewById<ImageView>(R.id.rightShoeImage)
        playerNameTextView?.text = user?.fullname
        descriptionProgress?.text = getString(R.string.upload_program_sheet_state_initial_title)
        leftShoeImage?.setColorFilter(R.color.colorPrimaryLight)
        rightShoeImage?.setColorFilter(R.color.colorPrimaryLight)

        animator.removeAllUpdateListeners()
        animator.removeAllListeners()
        if (animator.isStarted) { animator.end() }
        animator.cancel()
        animator.setIntValues(getColor(R.color.colorPrimaryLight), getColor(R.color.colorPrimaryVariant))
        animator.setEvaluator(ArgbEvaluator())
        animator.addUpdateListener {
            val animatedValue = animator.animatedValue as Int
            when (foot) {
                Foot.LEFT -> {
                    leftShoeImage?.setColorFilter(animatedValue)
                }
                Foot.RIGHT -> {
                    rightShoeImage?.setColorFilter(animatedValue)
                }
            }
        }
        animator.setDuration(500)
        animator.repeatCount = ValueAnimator.INFINITE
        animator.repeatMode = ValueAnimator.REVERSE
        animator.start()

        /**
         * Bluetooth
         * Connect to the device
         */
        BLEManager.disconnectDevice({
            descriptionProgress?.text = getString(R.string.upload_program_sheet_state_connecting_title)
            uploadProgressProgram?.setProgress(40)
            BLEManager.connectDevice(this)
        }, 2000)


        /**
         * Bluetooth
         * Listen connection changes
         */
        BLEManager.onConnectionStateChange = { gatt, status, newState ->
            if (status != BluetoothGatt.GATT_SUCCESS) {
                runOnUiThread {
                    descriptionProgress?.text = getString(R.string.upload_program_sheet_state_error_connection_title)
                }
                Handler(Looper.getMainLooper()).postDelayed({
                    when (foot) {
                        Foot.LEFT ->
                            this.uploadProgramToPlayer(trainingProgram, users, playerIndex,
                                Foot.RIGHT
                            )
                        Foot.RIGHT -> {
                            bottomSheetDialog.hide()
                            this.presenBottomtSheetUploader(trainingProgram, users, playerIndex + 1,
                                Foot.LEFT
                            )
                        }
                    }
                }, 2000)
            }

            when (newState) {
                BluetoothProfile.STATE_DISCONNECTED -> {
                    runOnUiThread {
                        if (programUploaded == false) {
                            descriptionProgress?.text = getString(R.string.upload_program_sheet_state_disconnected_title)
                        }
                    }

                    Handler(Looper.getMainLooper()).postDelayed({
                        programUploaded == false
                        when (foot) {
                            Foot.LEFT ->
                                this.uploadProgramToPlayer(trainingProgram, users, playerIndex,
                                    Foot.RIGHT
                                )
                            Foot.RIGHT -> {
                                bottomSheetDialog.hide()
                                this.presenBottomtSheetUploader(trainingProgram, users, playerIndex + 1,
                                    Foot.LEFT
                                )
                            }
                        }
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


        /**
         * Bluetooth
         * Listen services discovered
         * Start uploading program
         */
        BLEManager.onServiceDiscovered = {
            runOnUiThread {
                descriptionProgress?.text = getString(R.string.upload_program_sheet_state_writing_data_title)
                uploadProgressProgram?.setProgress(80)
                BLEManager.write(trainingProgram.programBytesDevice())
            }
        }

        /**
         * Bluetooth
         * When data are sent to the device
         * Show a message "program has been uploaded"
         * Disconnect device and
         */
        BLEManager.onCharacteristicWrite = {
            Log.i("CHARACTERISTIC_WRITE", it?.value.toString())
            runOnUiThread {
                descriptionProgress?.text = "Programma caricato"
                uploadProgressProgram?.setProgress(100)
                programUploaded = true
            }
            BLEManager.disconnectDevice()
        }
    }

    fun startTrainingProgram(trainingProgram: TrainingProgram) {
        realm.executeTransaction { realm ->
            realm.copyToRealmOrUpdate(trainingProgram.apply {
                startDate = Date()
                adapter.notifyDataSetChanged()
            })
        }
    }

}