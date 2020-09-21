package it.ninespartans.dinamo

import android.app.AlertDialog
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.*
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import io.realm.Realm
import io.realm.RealmResults
import it.ninespartans.dinamo.bluetooth.BLEManager
import it.ninespartans.dinamo.model.Player
import it.ninespartans.dinamo.model.Program
import it.ninespartans.dinamo.model.User
import kotlinx.android.synthetic.main.content_main.list_view
import kotlinx.android.synthetic.main.row_main_header.view.*
import kotlinx.android.synthetic.main.row_main_player.view.*
import kotlinx.android.synthetic.main.row_main_player_empty.view.*
import kotlinx.android.synthetic.main.row_main_player_header.view.*
import kotlinx.android.synthetic.main.row_main_program_empty.view.*
import android.view.LayoutInflater
import android.view.ViewGroup
import android.widget.*
import it.ninespartans.dinamo.model.Version


class MainActivity : AppCompatActivity() {
    private lateinit var adapter: DeviceAdapter
    private lateinit var user: User

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
        title = getString(R.string.title_activity_home)

        var realm = Realm.getDefaultInstance()
        val players = realm.where(Player::class.java).findAll()
        val programs = realm.where(Program::class.java).findAll()
        adapter = DeviceAdapter(this, players, programs)

        list_view.adapter = adapter

        adapter.onClickAction = {
            when (it) {
                DeviceAdapter.Action.CREATE_USER -> {
                    val intent = Intent(this, CreateUserActivity::class.java)
                    startActivity(intent)
                }
                DeviceAdapter.Action.DELETE_PROGRAM -> {
                    Realm.getDefaultInstance().use { realm ->
                        realm.executeTransaction {
                            realm.where(Program::class.java).findAll()?.let {
                                it.deleteAllFromRealm()
                                adapter.programs = realm.where(Program::class.java).findAll()
                                adapter.notifyDataSetChanged()
                            }
                        }
                    }
                }
                DeviceAdapter.Action.START_PROGRAM -> {
                    Toast.makeText(this, "start all", Toast.LENGTH_SHORT).show()
                }
                DeviceAdapter.Action.STOP_PROGRAM -> {
                    Toast.makeText(this, "Stop all", Toast.LENGTH_SHORT).show()
                }
                DeviceAdapter.Action.CREATE_PROGRAM -> {
                    val intent = Intent(this, CreateProgramActivity::class.java)
                    startActivity(intent)
                }
                DeviceAdapter.Action.ADD_PLAYER -> {
                    if (BLEManager.canStart(this) == false) {
                        val intent = Intent(this, DevicePairStartActivity::class.java)
                        startActivity(intent)
                        //overridePendingTransition(R.anim.bottom_up, R.anim.nothing)
                    } else {
                        val intent = Intent(this, CreatePlayerActivity::class.java)
                        startActivity(intent)
                    }
                }
            }
        }

        adapter.onClickActionOnItem = { action, player ->
            when (action) {
                DeviceAdapter.Action.DELETE_PLAYER -> {
                    val builderInner = AlertDialog.Builder(this)
                    builderInner.setTitle("Delete Pair")
                    builderInner.setNegativeButton("Cancel") { dialog, which ->
                        dialog.dismiss()
                    }
                    builderInner.setPositiveButton("Ok") { dialog, which ->
                        Realm.getDefaultInstance().use { realm ->
                            realm.executeTransaction {
                                var pairDevice = it.where(Player::class.java).equalTo("id", player.id).findAll()
                                pairDevice.deleteAllFromRealm()
                                updateList()
                            }
                        }
                    }
                    builderInner.show()
                }
                DeviceAdapter.Action.COMPLETE_PLAYER -> {
                    val intent = Intent(this, DevicePairSearchActivity::class.java)
                    intent.putExtra("player_id", player.id)
                    startActivity(intent)
                }
                DeviceAdapter.Action.UPDATE_PLAYER -> {
                    val intent = Intent(this, CreatePlayerActivity::class.java)
                    intent.putExtra("player_id", player.id)
                    startActivity(intent)
                }
            }
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
            R.id.action_profile -> {
                val intent = Intent(this, SettingsActivity::class.java)
                startActivity(intent)
                return true
            }
            android.R.id.home -> {
                val intent = Intent(this, SettingsActivity::class.java)
                startActivity(intent)
                return true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

    fun updateList() {
        Realm.getDefaultInstance().use { realm ->

            // User
            realm.where(User::class.java).findFirst()?.let {
                user = it
            }

            //Programs
            adapter.programs = realm.where(Program::class.java).findAll()

            // Players
            adapter.players = realm.where(Player::class.java).findAll()

            adapter.notifyDataSetChanged()
        }
    }

    /**
     * Adapter
     * ListView Adapter
     */
    private class DeviceAdapter(context: Context, players: RealmResults<Player>, programs: RealmResults<Program>): BaseAdapter() {
        private val mContext: Context
        private var inflater: LayoutInflater
        var programs: RealmResults<Program>
        var players: RealmResults<Player>

        enum class Action {
            CREATE_USER,
            ADD_PLAYER,
            UPDATE_PLAYER,
            DELETE_PLAYER,
            COMPLETE_PLAYER,
            TURN_OFF_PLAYER,
            CREATE_PROGRAM,
            DELETE_PROGRAM,
            UPLOAD_PROGRAM,
            START_PROGRAM,
            STOP_PROGRAM
        }

        var onClickAction: ((Action) -> Unit)? = null
        var onClickActionOnItem: ((Action, Player) -> Unit)? = null

        init {
            this.players = players
            this.programs = programs
            mContext = context
            inflater = LayoutInflater.from(mContext)
        }

        override fun getCount(): Int {
            val header = 1
            val itemsHeader = 1
            val program = if (programs.size == 0) 1 else 0
            val count = header + program + itemsHeader + players.size
            return count
        }

        override fun getItemId(position: Int): Long {
            return position.toLong()
        }

        override fun getItem(position: Int): Player? {
            val header = 1
            val itemsHeader = 1
            val program = if (programs.size == 0) 1 else 0
            val offset = header + itemsHeader + program
            return players.get(position - offset)
        }

        override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
            val noItems = players.size == 0
            val hasItems = players.size > 0
            val noPrograms = programs.size == 0
            val hasPrograms = programs.size > 0

            val isHeader = position==0
            val isRowPlayerEmpty = position == 1 && noItems
            val isRowProgramEmpty = (position == 1 && hasItems && noPrograms) || (position == 2 && noItems && noPrograms)
            val isRowHeaderPlayer = (position == 1 && hasItems && hasPrograms) || (position == 2 && hasItems && noPrograms)
            var rowPlayerPosition = 0
            rowPlayerPosition = if (hasItems && hasPrograms) position - 2 else 0
            rowPlayerPosition = if (hasItems && !hasPrograms) position - 3 else rowPlayerPosition

            /**
             * Header Row
             * This row is for the manager
             */
            val rowHeader = inflater.inflate(R.layout.row_main_header, viewGroup, false)
            if (isHeader) {

                /*
                val timer = object: CountDownTimer(10000, 1000) {
                    override fun onTick(millisUntilFinished: Long) {
                        rowHeader.countDownTimerLabel.text = millisUntilFinished.toString()
                        //rowHeader.programProgressBar.progress = (millisUntilFinished/100).toInt()
                    }
                    override fun onFinish() {
                        rowHeader.countDownTimerLabel.text = "0"
                        //rowHeader.programProgressBar.progress = 100
                    }
                }
                timer.start()
                */

                rowHeader.programProgressBar.progress = 40
                //rowHeader.userSection.visibility = View.GONE

                rowHeader.userData.text = "Players: " + players.size.toString() + " | " + "Programs: " + programs.size.toString()

                rowHeader.createUser.setOnClickListener {
                    onClickAction?.let {
                        it(Action.CREATE_USER)
                    }
                }

                rowHeader.showAllPrograms.setOnClickListener {
                    val popupMenu = PopupMenu(mContext, it)
                    popupMenu.menuInflater.inflate(R.menu.popup_menu_card, popupMenu.menu)
                    popupMenu.menu.findItem(R.id.action_delete_all_programs).setVisible(true)
                    popupMenu.setOnMenuItemClickListener {
                        when (it.itemId) {
                            R.id.action_delete_all_programs ->
                                onClickAction?.let {
                                    it(Action.DELETE_PROGRAM)
                                }
                        }
                        true
                    }
                    popupMenu.show()
                }

                rowHeader.addNewProgram.setOnClickListener {
                    onClickAction?.let {
                        it(Action.CREATE_PROGRAM)
                    }
                }

                rowHeader.startStopTrainingProgram.setOnClickListener {
                    onClickAction?.let {
                        it(Action.START_PROGRAM)
                        it(Action.STOP_PROGRAM)
                    }
                }

                rowHeader.selectTrainingProgram.setOnClickListener {
                    onClickAction?.let {
                        it(Action.UPLOAD_PROGRAM)
                    }
                }

                return rowHeader
            }

            /**
             * Row for player empty
             */
            val rowPlayerEmpty = inflater.inflate(R.layout.row_main_player_empty, viewGroup, false)
            if (isRowPlayerEmpty) {
                rowPlayerEmpty.noPlayerCardCreateButton.setOnClickListener {
                    onClickAction?.let {
                        it(Action.ADD_PLAYER)
                    }
                }
                return rowPlayerEmpty
            }

            /**
             * Row for program empty
             */
            val rowProgramEmpty = inflater.inflate(R.layout.row_main_program_empty, viewGroup, false)
            if (isRowProgramEmpty) {
                rowProgramEmpty.noProgramCardCreateButton.setOnClickListener {
                    onClickAction?.let {
                        it(Action.CREATE_PROGRAM)
                    }
                }
                return rowProgramEmpty
            }

            /**
             * Header Player
             */
            val rowPlayerHeader = inflater.inflate(R.layout.row_main_player_header, viewGroup, false)
            if (isRowHeaderPlayer) {
                rowPlayerHeader.addNewPlayer.setOnClickListener {
                    onClickAction?.let {
                        it(Action.ADD_PLAYER)
                    }
                }

                return rowPlayerHeader
            }

            /**
             * Player Row
             * This row is for single player
             */
            val rowPlayer = inflater.inflate(R.layout.row_main_player, viewGroup, false)

            val player = players.get(rowPlayerPosition)
            val leftdevice = player?.leftDevice
            val rightDevice = player?.rightDevice

            val noDevices = leftdevice == null && rightDevice == null
            val missingOneDevice = leftdevice == null || rightDevice == null

            val hasProgram = player?.program != null

            val leftDeviceVersion =  leftdevice?.firmwareVersion ?: "0"
            val rightDeviceVersion =  rightDevice?.firmwareVersion ?: "0"
            val leftVersion = Version(leftDeviceVersion)
            val rightVersion = Version(rightDeviceVersion)
            val deviceVersionEqual = leftVersion.equals(rightVersion)

            /**
             * Player informations
             */
            rowPlayer.textViewPlayerName.text = player?.name
            rowPlayer.textViewPlayerRole.text = if (player?.role!!.isEmpty()) "Ruolo" else player.role

            /**
             * Device informations
             */
            if (noDevices) {
                rowPlayer.deviceInfoSection.visibility = View.GONE
            } else if (missingOneDevice) {
                rowPlayer.deviceInfoSection.visibility = View.VISIBLE

                leftdevice?.let {
                    rowPlayer.deviceName.text = it.name
                    rowPlayer.deviceVersion.text = it.firmwareVersion
                    rowPlayer.stateText.text =  "MISSING RIGHT"
                }

                rightDevice?.let {
                    rowPlayer.deviceName.text = it.name
                    rowPlayer.deviceVersion.text = it.firmwareVersion
                    rowPlayer.stateText.text =  "MISSING LEFT"
                }

            } else if (!deviceVersionEqual) {
                
            } else {
                rowPlayer.stateText.text = "COMPLETED"
            }

            /**
             * Action section
             */
            rowPlayer.playPauseButton.visibility = View.GONE
            rowPlayer.programSelection.visibility = View.GONE
            rowPlayer.completePairingDevices.visibility = View.GONE
            rowPlayer.updateDevices.visibility = View.GONE

            rowPlayer.programSessionSection.visibility = if (missingOneDevice) View.GONE else View.VISIBLE
            rowPlayer.completePairingDevices.visibility = if (missingOneDevice) View.VISIBLE else View.GONE

            rowPlayer.playerProgressProgram.progress = (0..100).random()

            /**
             * 1. Has program running or not
             * 2. Has unpair devices
             * 3. Has new version to update
             */
            var hasUnpairedDevices = false
            var hasNewVersion = false

            if (hasUnpairedDevices) {
                // no program are allowed to work
                // no new version are allowed to upload
            }

            if (hasNewVersion) {
                // can work if devices are paired both
                // if devices has different versions
            }

            //player.program?.let {

            //}

            if (hasProgram) {
                // only when devices are paired correctly
                // only when the program is active or finished
                // can stop/start the program when the device is near
                // can change the program that is running and chose another one

                // Can have version to update
                // if you want to update, the program will stop
            }


            /**
             * Start session exercise for single player
             */
            rowPlayer.playPauseButton.setOnClickListener {
                onClickActionOnItem?.let {
                    it(Action.STOP_PROGRAM, player)
                    it(Action.STOP_PROGRAM, player)
                }
            }

            /**
             * Upload program to single player and start directly
             */
            rowPlayer.programSelection.setOnClickListener {
                onClickActionOnItem?.let {
                    it(Action.UPLOAD_PROGRAM, player)
                }
            }

            /**
             * Complete pairing with devices if not complete
             */
            rowPlayer.completePairingDevices.setOnClickListener {
                onClickActionOnItem?.let {
                    it(Action.COMPLETE_PLAYER, player)
                }
            }

            /**
             * Update devices firmware if there is a new version available
             */
            rowPlayer.updateDevices.setOnClickListener {
                onClickActionOnItem?.let {
                    it(Action.UPDATE_PLAYER, player)
                }
            }

            /**
             * Options of the player
             */
            rowPlayer.showOptions.setOnClickListener {
                val popupMenu = PopupMenu(mContext, it)
                popupMenu.menuInflater.inflate(R.menu.popup_menu_card, popupMenu.menu)
                popupMenu.menu.findItem(R.id.action_complete).setEnabled(missingOneDevice)
                popupMenu.menu.findItem(R.id.action_update_player).setVisible(true)
                popupMenu.menu.findItem(R.id.action_update_devices).setVisible(true)
                popupMenu.menu.findItem(R.id.action_complete).setVisible(true)
                popupMenu.menu.findItem(R.id.action_delete).setVisible(true)
                popupMenu.menu.findItem(R.id.turn_off_player).setVisible(true)

                popupMenu.setOnMenuItemClickListener {
                    when (it.itemId) {
                        R.id.action_update_player ->
                            onClickActionOnItem?.let {
                                it(Action.UPDATE_PLAYER, player)
                            }
                        R.id.action_update_devices ->
                            onClickActionOnItem?.let {
                                it(Action.COMPLETE_PLAYER, player)
                            }
                        R.id.action_complete ->
                            onClickActionOnItem?.let {
                                it(Action.COMPLETE_PLAYER, player)
                            }
                        R.id.action_delete ->
                            onClickActionOnItem?.let {
                                it(Action.DELETE_PLAYER, player)
                            }
                        R.id.turn_off_player ->
                            onClickActionOnItem?.let {
                                it(Action.TURN_OFF_PLAYER, player)
                            }
                    }
                    true
                }
                popupMenu.show()
            }

            return rowPlayer
        }
    }

}
