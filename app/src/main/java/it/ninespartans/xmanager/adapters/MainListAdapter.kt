package it.ninespartans.xmanager.adapters

import android.content.Context
import android.os.CountDownTimer
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.PopupMenu
import io.realm.Realm
import io.realm.RealmMap
import io.realm.RealmResults
import io.realm.kotlin.where
import it.ninespartans.xmanager.R
import it.ninespartans.xmanager.common.Version
import it.ninespartans.xmanager.model.Player
import it.ninespartans.xmanager.model.TrainingSessionProgram
import it.ninespartans.xmanager.model.User
import kotlinx.android.synthetic.main.row_main_header.view.*
import kotlinx.android.synthetic.main.row_main_player.view.*
import kotlinx.android.synthetic.main.row_main_player_empty.view.*
import kotlinx.android.synthetic.main.row_main_player_header.view.*
import kotlinx.android.synthetic.main.row_main_program_empty.view.*
import java.util.concurrent.TimeUnit


class MainListAdapter(context: Context, players: RealmResults<Player>, programs: RealmResults<TrainingSessionProgram>): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    var programs: RealmResults<TrainingSessionProgram>
    var players: RealmResults<Player>
    val realm: Realm = Realm.getDefaultInstance()

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
        SHOW_PROGRAM,
        CREATE_PROGRAM, // Program
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


            //.sortedWith(compareBy<Player, String?>(nullsLast(), {
              //  it.name
                //it.leftDevice// && it.rightDevice
            //}))
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

            /**
             * User section
             */
            rowHeader.user_section_header.visibility = View.GONE
            realm.where<User>().findFirst()?.let {
                rowHeader.user_section_header.visibility = View.VISIBLE
                rowHeader.fullname.text = it.fullName
                rowHeader.userTitle.text = it.headline
            }


            /**
             * Training Session Section
             */
            rowHeader.current_program_section.visibility = View.GONE
            rowHeader.programSectionActions.visibility = if (noPrograms) View.GONE else View.VISIBLE

            val activeSessionProgram = realm.where<TrainingSessionProgram>()
                .equalTo("active", true)
                .findFirst()

            rowHeader.programTitle.text = "Default program"
            rowHeader.programDescription.text = "In corso"

            rowHeader.labelDescriptionCreateProgram.text ="Select the program and start session."

            activeSessionProgram?.let {
                rowHeader.current_program_section.visibility = View.VISIBLE
                rowHeader.programProgressBar.progress = 40

                val duration:Long = 1 * 1 * 10 * 1000

                rowHeader.programProgressBar.max = duration.toInt()

                val timer = object: CountDownTimer(duration, 10) {

                    override fun onTick(millisUntilFinished: Long) {
                        val hours = TimeUnit.MILLISECONDS.toHours(millisUntilFinished) % 60
                        var hoursStr = hours.toString()
                        if (hoursStr.length < 2) hoursStr = "0$hours"

                        val minutes = TimeUnit.MILLISECONDS.toMinutes(millisUntilFinished) % 60
                        var minutesStr = minutes.toString()
                        if (minutesStr.length < 2) minutesStr = "0$minutes"

                        val seconds = TimeUnit.MILLISECONDS.toSeconds(millisUntilFinished) % 60
                        var secondsStr = seconds.toString()
                        if (secondsStr.length < 2) secondsStr = "0$seconds"

                        val millisec= TimeUnit.MILLISECONDS.toMillis(millisUntilFinished) % 60
                        var millisecStr = millisec.toString()
                        if (millisecStr.length < 2) millisecStr = "0$millisec"

                        rowHeader.countDownTimerLabel.text = "$hoursStr:$minutesStr:$secondsStr:$millisecStr"

                        rowHeader.programProgressBar.progress = (duration.toInt()) - millisUntilFinished.toInt()
                    }

                    override fun onFinish() {
                        rowHeader.countDownTimerLabel.text = "00:00:00:00"
                        rowHeader.programProgressBar.progress = duration.toInt()
                    }
                }

                timer.start()

                rowHeader.programTitle.text = it.title
                rowHeader.programDescription.text = "In corso"
                rowHeader.labelDescriptionCreateProgram.text = ""
            }


            rowHeader.selectProgram.setOnClickListener {
                onClickAction?.let {
                    it(Action.UPLOAD_PROGRAM)
                }
            }
            rowHeader.showProgramSectionMenu.setOnClickListener {
                onClickAction?.let {
                    it(Action.SHOW_PROGRAM)
                }
                /*
                val popupMenu = PopupMenu(mContext, it)
                popupMenu.menuInflater.inflate(R.menu.popup_menu_card, popupMenu.menu)
                popupMenu.menu.findItem(R.id.action_delete_all_programs).setVisible(true)
                popupMenu.menu.findItem(R.id.action_show_all_programs).setVisible(true)
                popupMenu.setOnMenuItemClickListener {
                    when (it.itemId) {
                        R.id.action_delete_all_programs ->
                            onClickAction?.let {
                                it(Action.DELETE_PROGRAM)
                            }
                        R.id.action_show_all_programs  ->
                            onClickAction?.let {
                                it(Action.SHOW_PROGRAM)
                            }
                    }
                    true
                }
                popupMenu.show()
                */
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
            /*rowPlayerHeader.addNewPlayer.setOnClickListener {
                onClickAction?.let {
                    it(Action.ADD_PLAYER)
                }
            }*/
            rowPlayerHeader.textViewPlayersCount.text = players.size.toString()
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
        val missingBothDevices = leftdevice == null && rightDevice == null

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
            rowPlayer.statusLayout.setBackgroundResource(R.color.primaryUnactiveColor)
        } else if (missingOneDevice) {
            rowPlayer.deviceInfoSection.visibility = View.VISIBLE
            rowPlayer.statusLayout.setBackgroundResource(R.color.primaryActiveColor)

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
        rowPlayer.completePairingDevices.visibility = if (missingBothDevices) View.VISIBLE else View.GONE
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

