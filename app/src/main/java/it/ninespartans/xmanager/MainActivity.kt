package it.ninespartans.xmanager

import android.animation.ArgbEvaluator
import android.animation.ValueAnimator
import android.app.AlertDialog
import android.app.Dialog
import android.bluetooth.BluetoothGatt
import android.bluetooth.BluetoothProfile
import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.LayerDrawable
import android.os.*
import android.util.DisplayMetrics
import android.util.Log
import android.view.*
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import io.realm.Realm
import it.ninespartans.xmanager.bluetooth.BLEManager
import android.widget.*
import com.google.android.material.bottomsheet.BottomSheetDialog
import io.realm.RealmResults
import io.realm.kotlin.where
import it.ninespartans.xmanager.adapters.MainListAdapter
import it.ninespartans.xmanager.adapters.ProgramSelectAdapter
import it.ninespartans.xmanager.common.Common
import it.ninespartans.xmanager.model.*
import kotlinx.android.synthetic.main.content_main.*


class MainActivity : AppCompatActivity() {
    private lateinit var adapter: MainListAdapter
    private lateinit var user: User

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
        title = getString(R.string.title_activity_home)

        var realm = Realm.getDefaultInstance()
        val players = realm.where<Player>()
            .findAll()

        val programs = realm.where<TrainingSessionProgram>().findAll()
        adapter = MainListAdapter(this, players, programs)

        list_view.adapter = adapter

        adapter.onClickAction = {
            when (it) {
                MainListAdapter.Action.CREATE_USER -> {
                    val intent = Intent(this, CreateUserActivity::class.java)
                    startActivity(intent)
                }
                MainListAdapter.Action.DELETE_PROGRAM -> {
                    Realm.getDefaultInstance().use { realm ->
                        realm.executeTransaction {
                            realm.where<TrainingSessionProgram>().findAll()?.let {
                                it.deleteAllFromRealm()
                                adapter.programs = realm.where(TrainingSessionProgram::class.java).findAll()
                                adapter.notifyDataSetChanged()
                            }
                        }
                    }
                }
                MainListAdapter.Action.START_PROGRAM -> {
                    Toast.makeText(this, "start all", Toast.LENGTH_SHORT).show()
                }
                MainListAdapter.Action.STOP_PROGRAM -> {
                    var realm = Realm.getDefaultInstance()
                    val programs = realm.where<TrainingSessionProgram>().findAll()
                    realm.executeTransaction { realm ->
                        programs.forEach { it.active = false }
                    }
                    updateList()
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
                    val intent = Intent(this, CreatePlayerActivity::class.java)
                    startActivity(intent)
                }
            }
        }

        adapter.onClickActionOnItem = { action, player ->
            when (action) {
                MainListAdapter.Action.EDIT_PLAYER -> {
                    val intent = Intent(this, CreatePlayerActivity::class.java)
                    intent.putExtra("player_id", player.id)
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
                        Realm.getDefaultInstance().use { realm ->
                            realm.executeTransaction {
                                player.leftDevice?.deleteFromRealm()
                                player.rightDevice?.deleteFromRealm()
                                player.deleteFromRealm()
                                updateList()
                            }
                        }
                    }
                    builderInner.show()
                }
                MainListAdapter.Action.COMPLETE_DEVICES -> {
                    val intent = Intent(this, DevicePairSearchActivity::class.java)
                    intent.putExtra("player_id", player.id)
                    startActivity(intent)
                }
                MainListAdapter.Action.DELETE_DEVICES -> {
                    Realm.getDefaultInstance().use { realm ->
                        realm.executeTransaction {
                            player.leftDevice?.deleteFromRealm()
                            player.rightDevice?.deleteFromRealm()
                            updateList()
                        }
                    }
                }
                MainListAdapter.Action.UPLOAD_PROGRAM -> {
                    val intent = Intent(this, ProgramListActivity::class.java)
                    startActivity(intent)
                }
            }
        }

        fab.setOnClickListener {
            val popupMenu = PopupMenu(this, it)
            popupMenu.menuInflater.inflate(R.menu.popup_fab_main, popupMenu.menu)
            popupMenu.setOnMenuItemClickListener {
                when (it.itemId) {
                    R.id.action_create_program ->
                        startActivity(Intent(this, CreateProgramActivity::class.java))
                    R.id.action_create_player  ->
                        startActivity(Intent(this, CreatePlayerActivity::class.java))
                }
                true
            }
            popupMenu.show()
        }

    }

    override fun onStart() {
        super.onStart()
        updateList()
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
                val intent = Intent(this, CreateUserActivity::class.java)
                startActivity(intent)
                return true
            }
            android.R.id.home -> {
                val intent = Intent(this, CreateUserActivity::class.java)
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
        //bottomSheetDialog.behavior?.isDraggable = false

        var realm = Realm.getDefaultInstance()
        val programs = realm.where<TrainingSessionProgram>().findAll()

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
            updateList()


            /**
             * Read Players that have at least 1 device connected
             * If there are no device connected to the players show an alert
             */
            var realm = Realm.getDefaultInstance()
            var playersQuery = realm.where<Player>()
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
                    startActivity(Intent(this, CreatePlayerActivity::class.java))
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

            uploadProgramToPlayer(selectedProgram, players)
        }

        bottomSheetDialog?.show()
        Common.setWhiteNavigationBar(bottomSheetDialog)
    }

    fun uploadProgramToPlayer(trainingProgram: TrainingSessionProgram?, players: RealmResults<Player>, playerIndex: Int = 0) {

        /**
         * When index exceed the player size, do not continue
         * Otherwise continue
         */
        if (playerIndex >= players.size) { return }
        val player = players[playerIndex]

        val hasLeftDevice = if (player?.leftDevice != null) true else false
        val hasRightDevice = if (player?.rightDevice != null) true else false
        val hasBothDevices = hasLeftDevice && hasRightDevice

        player?.leftDevice?.let {
            //this.uploadProgramToPlayer(playerIndex)
            //return
        }

        player?.rightDevice?.let {
            //this.uploadProgramToPlayer(playerIndex)
            //return
        }

        /*
        if (device == null) {
            player?.leftDevice?.let {
                this.uploadProgramToPlayer(playerIndex, player?.leftDevice)
                return
            }
            player?.rightDevice?.let {
                this.uploadProgramToPlayer(playerIndex, player?.rightDevice)
                return
            }
        }*/

        var bottomSheetDialog = BottomSheetDialog(this)
        bottomSheetDialog.setContentView(R.layout.content_upload_program_bottom_sheet)
        bottomSheetDialog.behavior?.isDraggable = false
        bottomSheetDialog.setCancelable(false)
        bottomSheetDialog?.show()
        Common.setWhiteNavigationBar(bottomSheetDialog)

        /**
         * Title Sheet
         */
        var title = bottomSheetDialog.findViewById<TextView>(R.id.title)
        title?.text = getString(R.string.upload_program_sheet_title)

        /**
         * Description Sheet
         */
        var description = bottomSheetDialog.findViewById<TextView>(R.id.description)
        description?.text = getString(R.string.upload_program_sheet_description)

        /**
         * Player Name
         */
        var playerNameTextView = bottomSheetDialog.findViewById<TextView>(R.id.playerNameTextView)
        playerNameTextView?.text = player?.fullname

        /**
         * Progress Bar Title
         * ProgressBar
         */
        var descriptionProgress = bottomSheetDialog.findViewById<TextView>(R.id.progressBarTitle)
        descriptionProgress?.text = getString(R.string.upload_program_sheet_state_initial_title)
        var uploadProgressProgram = bottomSheetDialog.findViewById<ProgressBar>(R.id.uploadProgressProgram)
        uploadProgressProgram?.max = 100
        val numDevices = if (player?.leftDevice != null && player?.rightDevice != null)  2 else 1
        uploadProgressProgram?.setProgress(0)

        /**
         * Left & Right Shoe Image
         */
        val leftShoeImage = bottomSheetDialog.findViewById<ImageView>(R.id.leftShoeImage)
        leftShoeImage?.setColorFilter(R.color.primaryDisabledColor)
        val rightShoeImage = bottomSheetDialog.findViewById<ImageView>(R.id.rightShoeImage)
        rightShoeImage?.setColorFilter(R.color.primaryDisabledColor)

        val animator = ValueAnimator()
        animator.setIntValues(getColor(R.color.primaryDisabledColor), getColor(R.color.primaryActiveColor))
        animator.setEvaluator(ArgbEvaluator())
        animator.addUpdateListener {
            val animatedValue = animator.animatedValue as Int
            leftShoeImage?.setColorFilter(animatedValue)
        }
        animator.setDuration(500)
        animator.repeatCount = ValueAnimator.INFINITE
        animator.repeatMode = ValueAnimator.REVERSE
        animator.start()


        player?.leftDevice?.let {
            //this.uploadProgramToPlayer(playerIndex)
            //return
            uploadProgressProgram?.setProgress(20)
            BLEManager.getDevice(it.ble_mac.toUpperCase())

        }?:run {
            player?.rightDevice?.let {
                //this.uploadProgramToPlayer(playerIndex)
                //return
                uploadProgressProgram?.setProgress(20)
                BLEManager.getDevice(it.ble_mac.toUpperCase())
            }
        }



        /**
         * Connect to the device
         */
        BLEManager.disconnectDevice({
            runOnUiThread {
                descriptionProgress?.text = getString(R.string.upload_program_sheet_state_connecting_title)
                //description?.text = getString(R.string.upload_program_sheet_state_connecting_description)
                uploadProgressProgram?.setProgress(40)
            }
            BLEManager.connectDevice(this)
        }, 2000)

        /**
         * Listen connection changes
         */
        BLEManager.onConnectionStateChange = { gatt, status, newState ->

            if (status != BluetoothGatt.GATT_SUCCESS) {
                runOnUiThread {
                    descriptionProgress?.text = getString(R.string.upload_program_sheet_state_error_connection_title)
                    //description?.text = getString(R.string.upload_program_sheet_state_error_connection_description)
                }

                Handler(Looper.getMainLooper()).postDelayed({
                    bottomSheetDialog.hide()
                    this.uploadProgramToPlayer(trainingProgram, players, playerIndex + 1)
                }, 2000)
            }

            when (newState) {
                BluetoothProfile.STATE_DISCONNECTED -> {
                    runOnUiThread {
                        descriptionProgress?.text = getString(R.string.upload_program_sheet_state_disconnected_title)
                        //description?.text = getString(R.string.upload_program_sheet_state_disconnected_description)
                    }

                    Handler(Looper.getMainLooper()).postDelayed({
                        bottomSheetDialog.hide()
                        this.uploadProgramToPlayer(trainingProgram, players, playerIndex + 1)
                    }, 2000)

                }
                BluetoothProfile.STATE_CONNECTED -> {
                    runOnUiThread {
                        descriptionProgress?.text = getString(R.string.upload_program_sheet_state_connected_title)
                        uploadProgressProgram?.setProgress(50)
                        //description?.text = getString(R.string.upload_program_sheet_state_connected_description)
                    }
                }
            }
        }

        /**
         * Listen services
         */
        BLEManager.onServiceDiscovered = {
            runOnUiThread {
                descriptionProgress?.text = getString(R.string.upload_program_sheet_state_reading_resources_title)
                //description?.text = getString(R.string.upload_program_sheet_state_reading_resources_description)

                descriptionProgress?.text = "Caricamento programma"
                //description?.text = getString(R.string.upload_program_sheet_state_reading_resources_description)
                uploadProgressProgram?.setProgress(80)
            }

            trainingProgram?.let {

                // Tipo di comando
                var commandByteArray = byteArrayOf(0x7E)

                commandByteArray = commandByteArray.plus(
                    byteArrayOf(
                        0u.toByte(),   // LED position (0, 1, 2, 3, 4)
                        1u.toByte(),          // Animation (fixed, blink, fade)
                        "0".toByte(),   // Hours
                        "0".toByte(),   // Minutes
                        "3".toByte())) // Seconds

                commandByteArray = commandByteArray.plus(
                    byteArrayOf(
                        3u.toByte(),   // LED position (0, 1, 2, 3, 4)
                        1u.toByte(),          // Animation (fixed, blink, fade)
                        "0".toByte(),   // Hours
                        "0".toByte(),   // Minutes
                        "3".toByte())) // Seconds


                BLEManager.write(commandByteArray)
            }
        }

        /**
         * When data are send
         */
        BLEManager.onCharacteristicWrite = {
            Log.i("CHARACTERISTIC_WRITE", it?.value.toString())
            runOnUiThread {
                descriptionProgress?.text = "Programma caricato"
                uploadProgressProgram?.setProgress(100)
                //description?.text = getString(R.string.upload_program_sheet_state_reading_resources_description)
            }

            BLEManager.disconnectDevice({
                bottomSheetDialog.hide()
                this.uploadProgramToPlayer(trainingProgram, players, playerIndex + 1)
            }, 5000)
        }
        
    }

    fun updateList() {
        Realm.getDefaultInstance().use { realm ->

            // User
            realm.where<User>().findFirst()?.let {
                user = it
            }

            //Programs
            adapter.programs = realm.where<TrainingSessionProgram>().findAll()

            // Players
            adapter.players = realm.where<Player>().findAll()

            adapter.notifyDataSetChanged()
        }
    }
}
