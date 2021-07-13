package it.ninespartans.xmanager

import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.view.*
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import io.realm.Realm
import it.ninespartans.xmanager.bluetooth.BLEManager
import it.ninespartans.xmanager.model.Player
import it.ninespartans.xmanager.model.TrainingSessionProgram
import it.ninespartans.xmanager.model.User
import kotlinx.android.synthetic.main.content_main.list_view
import android.widget.*
import it.ninespartans.xmanager.adapters.MainListAdapter


class MainActivity : AppCompatActivity() {
    private lateinit var adapter: MainListAdapter
    private lateinit var user: User

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setSupportActionBar(toolbar)
        title = getString(R.string.title_activity_home)

        var realm = Realm.getDefaultInstance()
        val players = realm.where(Player::class.java).findAll()
        val programs = realm.where(TrainingSessionProgram::class.java).findAll()
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
                            realm.where(TrainingSessionProgram::class.java).findAll()?.let {
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
                    Toast.makeText(this, "Stop all", Toast.LENGTH_SHORT).show()
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
                    val intent = Intent(this, ProgramListActivity::class.java)
                    startActivity(intent)
                }
                MainListAdapter.Action.ADD_PLAYER -> {
                    if (BLEManager.canStart(this) == false) {
                        val intent = Intent(this, DevicePairStartActivity::class.java)
                        startActivity(intent)
                        //overridePendingTransition(R.anim.bottom_up, R.anim.nothing)
                    } else {
                        val intent = Intent(this, CreatePlayerActivity::class.java)
                        intent.putExtra("mode", "create")
                        startActivity(intent)
                    }
                }
            }
        }

        adapter.onClickActionOnItem = { action, player ->
            when (action) {
                MainListAdapter.Action.EDIT_PLAYER -> {
                    val intent = Intent(this, CreatePlayerActivity::class.java)
                    intent.putExtra("player_id", player.id)
                    intent.putExtra("mode", "edit")
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
                    intent.putExtra("player_name", player.name)
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

    fun updateList() {
        Realm.getDefaultInstance().use { realm ->

            // User
            realm.where(User::class.java).findFirst()?.let {
                user = it
            }

            //Programs
            adapter.programs = realm.where(TrainingSessionProgram::class.java).findAll()

            // Players
            adapter.players = realm.where(Player::class.java).findAll()

            adapter.notifyDataSetChanged()
        }
    }

}
