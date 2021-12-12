package com.ninespartans.xmanager

import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import com.ninespartans.xmanager.model.TrainingProgram
import kotlinx.android.synthetic.main.activity_program_list.*
import kotlinx.android.synthetic.main.content_program_list.*
import com.ninespartans.xmanager.adapters.ProgramListAdapter


class ProgramListActivity : AppCompatActivity() {
    private lateinit var adapter: ProgramListAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_program_list)
        setSupportActionBar(toolbar)

        val realm = Realm.getDefaultInstance()
        val programs = realm.where(TrainingProgram::class.java).findAll()

        adapter = ProgramListAdapter(this, programs)
        list_view.adapter = adapter
        list_view.setOnItemClickListener { parent, view, position, id ->
            val selectedProgram = programs.get(position)
            val intent = Intent(this, CreateProgramActivity::class.java)
            intent.putExtra("program_id", selectedProgram?._id.toString())
            startActivity(intent)
        }

        adapter.onClickActionOnItem = { action, program ->
            when (action) {
                ProgramListAdapter.Action.UPDATE_PROGRAM -> {
                    val intent = Intent(this, CreateProgramActivity::class.java)
                    intent.putExtra("program_id", program._id.toString())
                    startActivity(intent)
                }
                ProgramListAdapter.Action.DELETE_PROGRAM -> {
                    val builderInner = AlertDialog.Builder(this)
                    builderInner.setTitle("Attention!")
                    builderInner.setMessage("Before deleting the program be sure that you are not using it and you don't need it anymore. This process is not reversible.")
                    builderInner.setNegativeButton("Cancel") { dialog, which ->
                        dialog.dismiss()
                    }
                    builderInner.setPositiveButton("Delete") { dialog, which ->
                        Realm.getDefaultInstance().use { realm ->
                            realm.executeTransaction {
                                program.deleteFromRealm()
                                updateList()
                            }
                        }
                    }
                    builderInner.show()
                }
            }
        }

        createNewProgram.setOnClickListener {
            val intent = Intent(this, CreateProgramActivity::class.java)
            startActivity(intent)
        }

    }

    override fun onStart() {
        super.onStart()

        var realm = Realm.getDefaultInstance()
        val programs = realm.where(TrainingProgram::class.java).findAll()
        adapter.programs = programs
        adapter.notifyDataSetChanged()

    }

    fun updateList() {
        Realm.getDefaultInstance().use { realm ->
            adapter.programs = realm.where(TrainingProgram::class.java).findAll()
            adapter.notifyDataSetChanged()
        }
    }

}
