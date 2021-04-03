package it.ninespartans.xmanager.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.PopupMenu
import io.realm.RealmResults
import it.ninespartans.xmanager.R
import it.ninespartans.xmanager.common.Version
import it.ninespartans.xmanager.model.Player
import it.ninespartans.xmanager.model.TrainingProgram
import kotlinx.android.synthetic.main.row_main_header.view.*
import kotlinx.android.synthetic.main.row_main_player.view.*
import kotlinx.android.synthetic.main.row_main_player_empty.view.*
import kotlinx.android.synthetic.main.row_main_player_header.view.*
import kotlinx.android.synthetic.main.row_main_program_empty.view.*



class MainListAdapter(context: Context, players: RealmResults<Player>, programs: RealmResults<TrainingProgram>): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    var programs: RealmResults<TrainingProgram>
    var players: RealmResults<Player>

    enum class Action {
        CREATE_USER, // User
        ADD_PLAYER, // Player
        EDIT_PLAYER,
        DELETE_PLAYER,
        DISABLE_PLAYER,
        COMPLETE_DEVICES, // Devices
        UPDATE_DEVICES,
        DELETE_DEVICES,
        TURN_OFF_DEVICES,
        CREATE_PROGRAM, // Program
        DELETE_PROGRAM,
        UPLOAD_PROGRAM,
        START_PROGRAM,
        STOP_PROGRAM
    }

    var onClickAction: ((it.ninespartans.xmanager.adapters.MainListAdapter.Action) -> Unit)? = null
    var onClickActionOnItem: ((it.ninespartans.xmanager.adapters.MainListAdapter.Action, Player) -> Unit)? = null

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

        val hasSessionProgram = player?.sessionProgram != null

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
         * Program data
         */
        rowPlayer.programSessionSection.visibility = if (hasSessionProgram) View.VISIBLE else View.GONE
        rowPlayer.playerProgressProgram.progress = (0..100).random()
        rowPlayer.programPlayerTitle.text = player?.sessionProgram?.title
        rowPlayer.programPlayerState.text = "State of the program"
        rowPlayer.programPlayerTimerTitle.text = "Complentamento"
        rowPlayer.programPlayerTimer.text = "23:00"

        /**
         * Action section
         */

        /**
         * Start session exercise for single player
         */
        rowPlayer.playPauseButton.visibility = if (hasSessionProgram) View.VISIBLE else View.GONE
        rowPlayer.playPauseButton.setOnClickListener {
            onClickActionOnItem?.let {
                it(Action.STOP_PROGRAM, player)
                it(Action.STOP_PROGRAM, player)
            }
        }

        /**
         * Upload program to single player and start directly
         */
        rowPlayer.programSelection.visibility = if (noDevices || missingOneDevice) View.GONE else View.VISIBLE
        rowPlayer.programSelection.text = if (hasSessionProgram) "Change program" else "Select program"
        rowPlayer.programSelection.setOnClickListener {
            onClickActionOnItem?.let {
                it(Action.UPLOAD_PROGRAM, player)
            }
        }

        /**
         * Complete pairing with devices if not complete
         */
        rowPlayer.completePairingDevices.visibility = if (missingOneDevice) View.VISIBLE else View.GONE
        rowPlayer.completePairingDevices.setOnClickListener {
            onClickActionOnItem?.let {
                it(Action.COMPLETE_DEVICES, player)
            }
        }

        /**
         * Update devices firmware if there is a new version available
         */
        rowPlayer.updateDevices.visibility = View.GONE
        rowPlayer.updateDevices.setOnClickListener {
            onClickActionOnItem?.let {
                it(Action.UPDATE_DEVICES, player)
            }
        }

        /**
         * Options of the player
         */
        rowPlayer.showOptions.setOnClickListener {
            val popupMenu = PopupMenu(mContext, it)
            popupMenu.menuInflater.inflate(R.menu.popup_menu_card, popupMenu.menu)

            popupMenu.menu.findItem(R.id.action_complete_devices).setEnabled(missingOneDevice)

            popupMenu.menu.findItem(R.id.action_complete_devices).setVisible(true)
            popupMenu.menu.findItem(R.id.action_update_devices).setVisible(true)
            popupMenu.menu.findItem(R.id.action_delete_devices).setVisible(true)
            popupMenu.menu.findItem(R.id.turn_off_devices).setVisible(true)

            popupMenu.menu.findItem(R.id.action_edit_player).setVisible(true)
            popupMenu.menu.findItem(R.id.action_delete_player).setVisible(true)
            popupMenu.menu.findItem(R.id.action_disable_player).setVisible(true)

            popupMenu.setOnMenuItemClickListener {
                when (it.itemId) {

                    R.id.action_complete_devices ->
                        onClickActionOnItem?.let {
                            it(Action.COMPLETE_DEVICES, player)
                        }
                    R.id.action_update_devices ->
                        onClickActionOnItem?.let {
                            it(Action.UPDATE_DEVICES, player)
                        }
                    R.id.action_delete_devices ->
                        onClickActionOnItem?.let {
                            it(Action.DELETE_DEVICES, player)
                        }
                    R.id.turn_off_devices ->
                        onClickActionOnItem?.let {
                            it(Action.TURN_OFF_DEVICES, player)
                        }

                    R.id.action_edit_player ->
                        onClickActionOnItem?.let {
                            it(Action.EDIT_PLAYER, player)
                        }
                    R.id.action_delete_player ->
                        onClickActionOnItem?.let {
                            it(Action.DELETE_PLAYER, player)
                        }
                    R.id.action_disable_player ->
                        onClickActionOnItem?.let {
                            it(Action.DISABLE_PLAYER, player)
                        }
                }
                true
            }
            popupMenu.show()
        }

        return rowPlayer
    }
}

