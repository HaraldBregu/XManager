package it.ninespartans.dinamo

import android.app.AlertDialog
import android.bluetooth.BluetoothGattCharacteristic
import android.content.Context
import android.content.Intent
import android.opengl.Visibility
import android.os.Bundle
import android.util.Log
import android.view.*
import android.widget.ArrayAdapter
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import android.widget.BaseAdapter
import android.widget.PopupMenu
import android.widget.Toast
import io.realm.Realm
import io.realm.RealmResults
import it.ninespartans.dinamo.bluetooth.BLEManager
import it.ninespartans.dinamo.model.Player
import it.ninespartans.dinamo.model.User
import it.ninespartans.dinamo.model.Version
import kotlinx.android.synthetic.main.content_main.*
import kotlinx.android.synthetic.main.content_main.list_view
import kotlinx.android.synthetic.main.row_main_header.view.*
import kotlinx.android.synthetic.main.row_main_player.view.*
import java.util.*
import kotlin.collections.ArrayList


class MainActivity : AppCompatActivity() {
    private lateinit var adapter: DeviceAdapter
    private lateinit var user: User

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
        title = getString(R.string.title_activity_home)

        adapter = DeviceAdapter(this)
        adapter.items = ArrayList()
        list_view.adapter = adapter

        adapter.onClickAction = {
            when (it) {
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

        adapter.onClickActionOnItem = { action, dinamoPairDevice ->
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
                                var pairDevice = it.where(Player::class.java).equalTo("id", dinamoPairDevice.id).findAll()
                                pairDevice.deleteAllFromRealm()
                                updateList()
                            }
                        }
                    }
                    builderInner.show()
                }
                DeviceAdapter.Action.COMPLETE_PLAYER -> {
                    val intent = Intent(this, DevicePairSearchActivity::class.java)
                    intent.putExtra("dinamo_pair_device_id", dinamoPairDevice.id)
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

            // Players
            realm.where(Player::class.java).findAll()?.let {
                var list = ArrayList<Player>()
                it.forEach { player ->
                    var objectItem = Player()
                    objectItem.id = player.id
                    objectItem.name = player.name
                    objectItem.leftDevice = player.leftDevice
                    objectItem.rightDevice = player.rightDevice
                    list.add(objectItem)
                }
                adapter.items = list
                adapter.notifyDataSetChanged()
            }

            // User
            realm.where(User::class.java).findFirst()?.let {
                user = it
                //Toast.makeText(this, user.createdAt.toString(), Toast.LENGTH_SHORT).show()
            }
        }
    }

    /**
     * Adapter
     * ListView Adapter
     */

    private class DeviceAdapter(context: Context): BaseAdapter() {
        private val mContext: Context
        private var inflater: LayoutInflater
        var items: ArrayList<Player> = ArrayList()

        enum class Action {
            ADD_PLAYER,
            CREATE_PROGRAM,
            UPLOAD_PROGRAM,
            START_PROGRAM,
            STOP_PROGRAM,
            DELETE_PLAYER,
            COMPLETE_PLAYER,
            UPDATE_PLAYER,
            TURN_OFF_PLAYER
        }

        var onClickAction: ((Action) -> Unit)? = null
        var onClickActionOnItem: ((Action, Player) -> Unit)? = null

        init {
            mContext = context
            inflater = LayoutInflater.from(mContext)
        }

        override fun getCount(): Int {
            return items.size + 1
        }

        override fun getItemId(position: Int): Long {
            return position.toLong()
        }

        override fun getItem(position: Int): Any {
            return items.get(position - 1)
        }

        override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {

            /**
             * Header Row
             * This row is for the manager
             */
            val rowHeader = inflater.inflate(R.layout.row_main_header, viewGroup, false)
            if (position == 0) {

                rowHeader.addNewProgram.setOnClickListener {
                    onClickAction?.let {
                        it(Action.CREATE_PROGRAM)
                    }
                }

                rowHeader.addNewPlayer.setOnClickListener {
                    onClickAction?.let {
                        it(Action.ADD_PLAYER)
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
             * Player Row
             * This row is for single player
             */
            val rowPlayer = inflater.inflate(R.layout.row_main_player, viewGroup, false)
            val player = items.get(position - 1)


            rowPlayer.textViewName.text = player.name

            var pairIncomplete = (player.leftDevice == null) || (player.rightDevice == null)

            var stateString = ""
            stateString += if (pairIncomplete) "INCOMPLETE" else "COMPLETE"


            //Log.i("left_device", player.leftDevice.toString())
            //Log.i("rightDevice", player.rightDevice.toString())
            //val device = player.leftDevice?.bleMAC
            //val string = item.leftDevice?.firmwareVersion

            /*
            if (Version("1.0.0").equals(Version("1.0.1"))) {
                Toast.makeText(this, "Is equal version", Toast.LENGTH_SHORT).show()
            } else {
                Toast.makeText(this, "Is not equal version", Toast.LENGTH_SHORT).show()
            }*/

            //if (item.leftDevice?.version != null) {
            //}

            rowPlayer.stateText.text = stateString

            rowPlayer.programTrainingSetup.visibility = View.VISIBLE
            rowPlayer.completePairingDevices.visibility = View.VISIBLE
            rowPlayer.updateDevices.visibility = View.GONE

            if (position == 2) {
                rowPlayer.programSessionSection.visibility = View.GONE
                rowPlayer.playPauseButton.visibility = View.GONE
            } else {

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
            rowPlayer.programTrainingSetup.setOnClickListener {
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

                popupMenu.menu.findItem(R.id.action_complete).setEnabled(pairIncomplete)
                //popupMenu.menu.findItem(R.id.action_complete).setVisible(false)

                popupMenu.setOnMenuItemClickListener {
                    when (it.itemId) {
                        R.id.action_update ->
                            onClickActionOnItem?.let {
                                it(Action.UPDATE_PLAYER, player)
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
