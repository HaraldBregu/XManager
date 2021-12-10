package it.ninespartans.xmanager.adapters

import android.annotation.SuppressLint
import android.content.Context
import android.opengl.Visibility
import android.os.CountDownTimer
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.LinearLayout
import android.widget.PopupMenu
import io.realm.Realm
import io.realm.RealmMap
import io.realm.RealmResults
import io.realm.kotlin.where
import it.ninespartans.xmanager.R
import it.ninespartans.xmanager.common.Version
import it.ninespartans.xmanager.model.PlayerDeviceData
import it.ninespartans.xmanager.model.TrainingProgram
import it.ninespartans.xmanager.model.User
import kotlinx.android.synthetic.main.row_main_header.view.*
import kotlinx.android.synthetic.main.row_main_player.view.*
import kotlinx.android.synthetic.main.row_main_player_device_item.view.*
import kotlinx.android.synthetic.main.row_main_player_empty.view.*
import kotlinx.android.synthetic.main.row_main_player_header.view.*
import kotlinx.android.synthetic.main.row_main_program_empty.view.*
import org.jetbrains.anko.runOnUiThread
import java.util.*
import java.util.concurrent.TimeUnit
import kotlin.concurrent.fixedRateTimer


class MainListAdapter(context: Context, players: RealmResults<User>, programs: RealmResults<TrainingProgram>): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    var programs: RealmResults<TrainingProgram>
    var players: RealmResults<User>
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
    var onClickActionOnItem: ((Action, User) -> Unit)? = null

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

    override fun getItem(position: Int): User? {
        val header = 1
        val itemsHeader = 1
        val program = if (programs.size == 0) 1 else 0
        val offset = header + itemsHeader + program
        return players.get(position - offset)
    }

    override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
        val noPlayers = players.size == 0
        val hasPlayers = players.size > 0
        val noPrograms = programs.size == 0
        val hasPrograms = programs.size > 0

        val isHeader = position==0
        val isRowPlayerEmpty = position == 1 && noPlayers
        val isRowProgramEmpty = (position == 1 && hasPlayers && noPrograms) || (position == 2 && noPlayers && noPrograms)
        val isRowHeaderPlayer = (position == 1 && hasPlayers && hasPrograms) || (position == 2 && hasPlayers && noPrograms)
        var rowPlayerPosition = 0
        rowPlayerPosition = if (hasPlayers && hasPrograms) position - 2 else 0
        rowPlayerPosition = if (hasPlayers && !hasPrograms) position - 3 else rowPlayerPosition

        /**
         * Header Row
         * This Row is for the manager
         * It can be used to show data and information about the training
         */
        val rowHeader = inflater.inflate(R.layout.row_main_header, viewGroup, false)
        if (isHeader) {

            /**
             * User section
             */
            rowHeader.user_section_header.visibility = View.GONE
            realm.where<User>().findFirst()?.let {
                rowHeader.user_section_header.visibility = View.VISIBLE
                rowHeader.fullname.text = it.fullname
                if (it.headline != null && it.headline.length != 0) {
                    rowHeader.userTitle.text = it.headline
                } else {
                    rowHeader.userTitle.text = mContext.getString(R.string.main_header_user_no_title)
                }
            }


            /**
             * Training Session Section
             */
            rowHeader.current_program_section.visibility = View.GONE
            rowHeader.programSectionActions.visibility = if (noPrograms) View.GONE else View.VISIBLE

            val activeSessionProgram = realm.where<TrainingProgram>()
                .equalTo("active", true)
                .findFirst()

            activeSessionProgram?.let {
                rowHeader.programTitle.text = it.title //mContext.getString(R.string.main_header_program_running)

                rowHeader.current_program_section.visibility = View.VISIBLE
                rowHeader.programProgressBar.progress = 40

                var startDate = Date()
                var endDate = Date()
                it.startDate?.let {date ->
                    startDate = date
                    val calendar = Calendar.getInstance()
                    calendar.time = startDate
                    calendar.add(Calendar.SECOND, it.durationSeconds())
                    calendar.add(Calendar.MINUTE, it.durationMinutes())
                    calendar.add(Calendar.HOUR, it.durationHours())
                    endDate = calendar.time
                }

                var duration = endDate.time - startDate.time
                rowHeader.programProgressBar.max = duration.toInt()

                fixedRateTimer("timer", true, 0L, 10) {
                    val progress = Date().time - startDate.time

                    if (progress >= duration) {
                        this.cancel()
                    }

                    mContext.runOnUiThread {

                        rowHeader.programProgressBar.progress = progress.toInt()

                        val millisUntilFinished = duration - progress
                        if (millisUntilFinished <= 0) {
                            rowHeader.countDownTimerLabel.text = "00:00:00"
                            return@runOnUiThread
                        }

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

                        rowHeader.countDownTimerLabel.text = "$hoursStr:$minutesStr:$secondsStr"
                        //rowHeader.countDownTimerLabel.text = "$hoursStr:$minutesStr:$secondsStr:$millisecStr"
                    }
                }
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
         * This Row is visible when there are not player registered
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
         * This row is visible when there are no programs created
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
         * Row Header Player
         * This Row is visible when there are players
         * Yuo can show info about the number of players or other info
         */
        val rowPlayerHeader = inflater.inflate(R.layout.row_main_player_header, viewGroup, false)
        if (isRowHeaderPlayer) {
            rowPlayerHeader.textViewPlayersCount.text = players.size.toString()
            return rowPlayerHeader
        }

        /**
         * Player Row
         * This Row is for single player
         * You can show infor about the player,
         * the device of the player and programs running
         */
        val rowPlayer = inflater.inflate(R.layout.row_main_player, viewGroup, false)
        val player = players.get(rowPlayerPosition)

        //val leftdevice = player?.leftDevice
        //val rightDevice = player?.rightDevice
        //val noDevices = leftdevice == null && rightDevice == null
        //val missingOneDevice = leftdevice == null || rightDevice == null
        //val missingBothDevices = leftdevice == null && rightDevice == null
        //val hasSessionProgram = player?.sessionProgram != null
        //val leftDeviceVersion =  leftdevice?.firmwareVersion ?: "0"
        //val rightDeviceVersion =  rightDevice?.firmwareVersion ?: "0"
        //val leftVersion = Version(leftDeviceVersion)
        //val rightVersion = Version(rightDeviceVersion)
        //val deviceVersionEqual = leftVersion.equals(rightVersion)

        /** Hide info section if there are no devices */
        //rowPlayer.deviceInfoSection.visibility = if (noDevices) View.GONE else View.VISIBLE

        /** Player informations */
        rowPlayer.textViewPlayerName.text = player?.fullname
        rowPlayer.showOptions.setOnClickListener {
            val popupMenu = PopupMenu(mContext, it)
            popupMenu.menuInflater.inflate(R.menu.popup_menu_card, popupMenu.menu)
            //popupMenu.menu.findItem(R.id.action_complete_devices).setEnabled(missingOneDevice)
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
                            player?.let { it1 -> it(Action.COMPLETE_DEVICES, it1) }
                        }
                    R.id.action_update_devices ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.UPDATE_DEVICES, it1) }
                        }
                    R.id.action_delete_devices ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.DELETE_DEVICES, it1) }
                        }
                    R.id.turn_off_devices ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.TURN_OFF_DEVICES, it1) }
                        }
                    R.id.action_edit_player ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.EDIT_PLAYER, it1) }

                        }
                    R.id.action_delete_player ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.DELETE_PLAYER, it1) }
                        }
                    R.id.action_disable_player ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.DISABLE_PLAYER, it1) }
                        }
                }
                true
            }
            popupMenu.show()
        }

        /** Player Devices and Programs */
        val views = mutableListOf<PlayerDeviceData>()
/*
        leftdevice?.let {
            val view = inflater.inflate(R.layout.row_main_player_device_item, rowPlayer.deviceInfoSection, false)
            views.add(PlayerDeviceData(view, it))
        }

        rightDevice?.let {
            val view = inflater.inflate(R.layout.row_main_player_device_item, rowPlayer.deviceInfoSection, false)
        }*/

        views.forEach {
            rowPlayer.deviceInfoSection.addView(it.view)
            it.view.deviceName.text = it.device.name
            it.view.deviceNameVersion.text = it.device.firmwareVersion
            //it.view.programSessionSection.visibility = View.GONE//if (hasSessionProgram) View.VISIBLE else View.GONE
            it.view.programPlayerTitle.text = "Programma test"//player?.sessionProgram?.title
            it.view.programPlayerTimer.text = "00:00:00"
            it.view.playerProgressProgram.progress = (0..100).random()
        }

        rowPlayer.addPlayerDevice.setOnClickListener {
            onClickActionOnItem?.let {
                player?.let { it1 -> it(Action.COMPLETE_DEVICES, it1) }
            }
        }

/*
        if (noDevices) {
            rowPlayer.deviceName.text = "" // mContext.getString(R.string.row_player_no_device_subtitle)
            rowPlayer.deviceNameVersion.text = ""
            rowPlayer.statusLayout.setBackgroundResource(R.color.colorPrimaryLight)
        } else if (missingOneDevice) {
            rowPlayer.statusLayout.setBackgroundResource(R.color.colorPrimaryVariant)

            leftdevice?.let {
                rowPlayer.deviceName.text = it.name
                rowPlayer.deviceNameVersion.text = it.firmwareVersion
            }

            rightDevice?.let {
                rowPlayer.deviceName.text = it.name
                rowPlayer.deviceNameVersion.text = it.firmwareVersion
            }


        } else {
            rowPlayer.statusLayout.setBackgroundResource(R.color.colorPrimaryVariant)

            var deviceNames = ""

            leftdevice?.let {
                deviceNames += it.name + " " + it.firmwareVersion
            }

            rightDevice?.let {
                deviceNames =
                    if (deviceNames.length > 0 && deviceNames != (it.name + " " + it.firmwareVersion))
                        "$deviceNames | ${it.name + " " + it.firmwareVersion}"
                    else it.name + " " + it.firmwareVersion
            }

            rowPlayer.deviceName.text = deviceNames
        }

*/
        /**
         * Program data
         */

        /**
         * Action section
         */

        /**
         * Start session exercise for single player
         */
        /*
        rowPlayer.playPauseButton.visibility = View.GONE //if (hasSessionProgram) View.VISIBLE else View.GONE
        rowPlayer.playPauseButton.setOnClickListener {
            onClickActionOnItem?.let {
                it(Action.STOP_PROGRAM, player)
                it(Action.STOP_PROGRAM, player)
            }
        }*/

        /**
         * Complete pairing with devices if not complete
         */
        /*rowPlayer.leftChipDevice.setOnClickListener {
            onClickActionOnItem?.let {
                player?.let { it1 -> it(Action.COMPLETE_DEVICES, it1) }
            }
        }
        rowPlayer.rightChipDevice.setOnClickListener {
            onClickActionOnItem?.let {
                player?.let { it1 -> it(Action.COMPLETE_DEVICES, it1) }
            }
        }*/


        return rowPlayer
    }
}

