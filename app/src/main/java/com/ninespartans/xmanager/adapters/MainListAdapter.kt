package com.ninespartans.xmanager.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.*
import androidx.cardview.widget.CardView
import com.google.android.material.button.MaterialButton
import com.google.android.material.card.MaterialCardView
import com.google.android.material.progressindicator.LinearProgressIndicator
import com.ninespartans.xmanager.R
import com.ninespartans.xmanager.model.*
import io.realm.Realm
import io.realm.kotlin.where
import org.jetbrains.anko.runOnUiThread
import java.util.*
import java.util.concurrent.TimeUnit
import kotlin.concurrent.fixedRateTimer


class MainListAdapter(context: Context): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    private val realm = Realm.getDefaultInstance()
    private var account = realm.where<Account>().findFirst()
    private var players = realm.where<User>()
        .notEqualTo("account._id", account?._id)
        .findAll()
    private var programs = realm.where<DeviceProgram>().findAll()

    enum class Action {
        EDIT_ACCOUNT,
        SHOW_ACCOUNT,
        CREATE_USER, // User
        ADD_PLAYER, // Player
        EDIT_PLAYER,
        DELETE_PLAYER,
        DISABLE_PLAYER,
        REGISTER_DEVICE,
        COMPLETE_DEVICES, // Devices
        UPDATE_DEVICES,
        DELETE_DEVICES,
        TURN_OFF_DEVICES,
        SHOW_PROGRAM,
        CREATE_PROGRAM, // Program
        DELETE_PROGRAM,
        UPLOAD_PROGRAM,
        START_PROGRAM,
        STOP_PROGRAM,
        SELECT_DEVICE
    }

    var onClickAction: ((Action) -> Unit)? = null
    var onClickActionOnItem: ((Action, User) -> Unit)? = null
    var onClickActionOnDeviceItem: ((Action, Device) -> Unit)? = null

    init {
        mContext = context
        inflater = LayoutInflater.from(mContext)
    }

    fun updateData() {
        this.account = realm.where<Account>().findFirst()
        val users = realm.where<User>()
        if (account != null)
            users.notEqualTo("account._id", account?._id)
        this.players = users.findAll()
        this.programs = realm.where<DeviceProgram>().findAll()
        notifyDataSetChanged()
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

            /** User section */
            val userSection = rowHeader.findViewById<LinearLayout>(R.id.userSection)
            val fullname = rowHeader.findViewById<TextView>(R.id.fullname)
            val userTitle = rowHeader.findViewById<TextView>(R.id.userTitle)
            val userEditButton = rowHeader.findViewById<MaterialButton>(R.id.editAccount)
            userEditButton.visibility = View.GONE

            val account = realm.where<Account>().findFirst()
            val query = realm.where<User>()
            query.isNotNull("account")
            query.equalTo("account._id", account?._id)
            query.findFirst()?.let {
                fullname.text = it.fullname
                userTitle.text = mContext.getString(R.string.activity_main_header_account_description2)
                if (it.headline.isNotEmpty()) {
                    userTitle.text = it.headline
                }
                userEditButton.visibility = View.VISIBLE
            }

            userEditButton.setOnClickListener {
                onClickAction?.let {
                    it(Action.EDIT_ACCOUNT)
                }
            }

            userSection.setOnClickListener {
                onClickAction?.let {
                    if (userEditButton.visibility == View.GONE) {
                        it(Action.EDIT_ACCOUNT)
                    } else {
                        it(Action.SHOW_ACCOUNT)
                    }
                }
            }

            /** Training Session Section */
            val current_program_section = rowHeader.findViewById<LinearLayout>(R.id.current_program_section)
            val programSectionActions = rowHeader.findViewById<LinearLayout>(R.id.programSectionActions)
            current_program_section.visibility = View.GONE
            programSectionActions.visibility = if (noPrograms) View.GONE else View.VISIBLE

            val activeSessionProgram = realm.where<DeviceProgram>()
                .equalTo("active", true)
                .findFirst()

            activeSessionProgram?.let {
                val programTitle = rowHeader.findViewById<TextView>(R.id.programTitle)
                val current_program_section = rowHeader.findViewById<LinearLayout>(R.id.current_program_section)
                val programProgressBar = rowHeader.findViewById<LinearProgressIndicator>(R.id.programProgressBar)
                val countDownTimerLabel = rowHeader.findViewById<TextView>(R.id.countDownTimerLabel)

                programTitle.text = it.title //mContext.getString(R.string.main_header_program_running)

                current_program_section.visibility = View.VISIBLE
                programProgressBar.progress = 40

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
                programProgressBar.max = duration.toInt()

                fixedRateTimer("timer", true, 0L, 10) {
                    val progress = Date().time - startDate.time

                    if (progress >= duration) {
                        this.cancel()
                    }

                    mContext.runOnUiThread {

                        programProgressBar.progress = progress.toInt()

                        val millisUntilFinished = duration - progress
                        if (millisUntilFinished <= 0) {
                            countDownTimerLabel.text = "00:00:00"
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

                        countDownTimerLabel.text = "$hoursStr:$minutesStr:$secondsStr"
                        //rowHeader.countDownTimerLabel.text = "$hoursStr:$minutesStr:$secondsStr:$millisecStr"
                    }
                }
            }

            val selectProgram = rowHeader.findViewById<MaterialButton>(R.id.selectProgram)

            selectProgram.setOnClickListener {
                onClickAction?.let {
                    it(Action.UPLOAD_PROGRAM)
                }
            }

            return rowHeader
        }

        /**
         * Row for player empty
         * This Row is visible when there are not player registered
         */
        val rowPlayerEmpty = inflater.inflate(R.layout.row_main_player_empty, viewGroup, false)
        if (isRowPlayerEmpty) {
            val cardView = rowPlayerEmpty.findViewById<MaterialCardView>(R.id.cardView)

            cardView.setOnClickListener {
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
            val cardView = rowProgramEmpty.findViewById<MaterialCardView>(R.id.cardView)

            cardView.setOnClickListener {
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
            val textViewPlayersCount = rowPlayerHeader.findViewById<TextView>(R.id.textViewPlayersCount)
            textViewPlayersCount.text = players.size.toString()
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

        /** Hide info section if there are no devices */
        //rowPlayer.deviceInfoSection.visibility = if (noDevices) View.GONE else View.VISIBLE

        /** Player informations */
        val textViewPlayerName = rowPlayer.findViewById<TextView>(R.id.textViewPlayerName)
        val showOptions = rowPlayer.findViewById<MaterialButton>(R.id.showOptions)

        textViewPlayerName.text = player?.fullname
        showOptions.setOnClickListener {
            val popupMenu = PopupMenu(mContext, it)
            popupMenu.menuInflater.inflate(R.menu.popup_menu_card, popupMenu.menu)
            popupMenu.setOnMenuItemClickListener {
                when (it.itemId) {
                    R.id.action_edit_player ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.EDIT_PLAYER, it1) }
                        }
                    R.id.action_delete_player -> {
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.DELETE_PLAYER, it1) }
                        }
                    }
                    R.id.action_upload_program ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.UPLOAD_PROGRAM, it1) }
                        }
                    R.id.action_add_device -> {
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.REGISTER_DEVICE, it1) }
                        }
                    }
                    R.id.action_delete_devices ->
                        onClickActionOnItem?.let {
                            player?.let { it1 -> it(Action.DELETE_DEVICES, it1) }
                        }
                }
                true
            }
            popupMenu.show()
        }

        /** Player Devices and Programs */
        val deviceInfoSection = rowPlayer.findViewById<LinearLayout>(R.id.deviceInfoSection)
        deviceInfoSection.visibility = View.GONE
        val views = mutableListOf<PlayerDeviceData>()

        val devices = realm.where<Device>()
        devices.equalTo("user._id", player?._id)
        devices.findAll().forEach {
            deviceInfoSection.visibility = View.VISIBLE
            val view = inflater.inflate(R.layout.row_main_player_device_item, deviceInfoSection, false)
            views.add(PlayerDeviceData(view, it))
        }

        views.forEach {
            deviceInfoSection.addView(it.view)

            val container = it.view.findViewById<CardView>(R.id.container)
            val playerDeviceData = it
            container.setOnClickListener {
                onClickActionOnDeviceItem?.let {
                    it(Action.SELECT_DEVICE, playerDeviceData.device)
                }
            }

            val deviceName = it.view.findViewById<TextView>(R.id.deviceName)
            val deviceVersion = it.view.findViewById<TextView>(R.id.deviceVersion)
            val deviceState = it.view.findViewById<TextView>(R.id.deviceState)
            val deviceType = it.view.findViewById<TextView>(R.id.deviceType)
            val detailButton = it.view.findViewById<MaterialButton>(R.id.detailButton)

            detailButton.setOnClickListener {
                onClickActionOnDeviceItem?.let {
                    it(Action.SELECT_DEVICE, playerDeviceData.device)
                }
            }

            val programSessionSection = it.view.findViewById<LinearLayout>(R.id.programSessionSection)
            val programPlayerTitle = it.view.findViewById<TextView>(R.id.programPlayerTitle)
            val playerProgressProgram = it.view.findViewById<LinearProgressIndicator>(R.id.playerProgressProgram)
            val programPlayerTimer = it.view.findViewById<TextView>(R.id.programPlayerTimer)


            deviceName.text = it.device.name//.plus(" ").plus(it.device.version)
            deviceVersion.text = it.device.version
            deviceState.text = if (it.device.active) "ATTIVO" else "NON ATTIVO"
            when (it.device.type) {
                Device.DeviceType.NONE.name -> {
                    deviceType.text = "-"
                }
                Device.DeviceType.SHOE_LEFT.name -> {
                    deviceType.text = "SINISTRA"
                }
                Device.DeviceType.SHOE_RIGHT.name -> {
                    deviceType.text = "DESTRA"
                }
            }

            programSessionSection.visibility = if (it.device.program == null) View.GONE else View.VISIBLE
            it.device.program?.let { deviceProgram ->
                programPlayerTitle.text = deviceProgram.title
                //it.view.programPlayerTimer.text = "00:00:00"
                playerProgressProgram.progress = 0

                val startDate = it.device.updatedAt
                val calendar = Calendar.getInstance()
                calendar.time = startDate
                calendar.add(Calendar.SECOND, deviceProgram.durationSeconds())
                calendar.add(Calendar.MINUTE, deviceProgram.durationMinutes())
                calendar.add(Calendar.HOUR, deviceProgram.durationHours())
                val endDate = calendar.time

                val duration = endDate.time - startDate.time
                playerProgressProgram.max = duration.toInt()

                fixedRateTimer("timer", true, 0L, 10) {
                    val progress = Date().time - startDate.time
                    if (progress >= duration) { this.cancel() }

                    mContext.runOnUiThread {
                        playerProgressProgram.progress = progress.toInt()

                        val millisUntilFinished = duration - progress
                        if (millisUntilFinished <= 0) {
                            //it.view.programPlayerTimer.text = "00:00:00"
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

                        programPlayerTimer.text = "$hoursStr:$minutesStr:$secondsStr"
                    }
                }
            }?: run {
                programPlayerTitle.text = mContext.getString(R.string.no_program_name)
                playerProgressProgram.progress = 0
            }
        }

        val addPlayerDevice = rowPlayer.findViewById<MaterialButton>(R.id.addPlayerDevice)

        addPlayerDevice.visibility = if (views.size > 0) View.GONE else View.VISIBLE
        addPlayerDevice.setOnClickListener {
            onClickActionOnItem?.let {
                player?.let { it1 -> it(Action.REGISTER_DEVICE, it1) }
            }
        }

        return rowPlayer
    }
}

