package it.ninespartans.xmanager

import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import it.ninespartans.xmanager.model.TrainingSessionProgram
import kotlinx.android.synthetic.main.activity_program_list.*
import kotlinx.android.synthetic.main.content_program_list.*
import it.ninespartans.xmanager.adapters.ProgramListAdapter

class ProgramListActivity : AppCompatActivity() {
    private lateinit var adapter: ProgramListAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_program_list)
        setSupportActionBar(toolbar)

        title = getString(R.string.title_activity_program_list)
        header_title.text = getString(R.string.title_activity_program_list_header_title)
        header_description.text = getString(R.string.title_activity_program_list_header_description)

        var realm = Realm.getDefaultInstance()
        val programs = realm.where(TrainingSessionProgram::class.java).findAll()

        adapter = ProgramListAdapter(this, programs)
        list_view.adapter = adapter
        list_view.setOnItemClickListener { parent, view, position, id ->

            val selectedProgram = programs.get(position)
            val intent = Intent(this, CreateProgramActivity::class.java)
            intent.putExtra("program_id", selectedProgram?.id)
            startActivity(intent)
        }

        adapter.onClickActionOnItem = { action, program ->
            when (action) {
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
        val programs = realm.where(TrainingSessionProgram::class.java).findAll()
        adapter.programs = programs
        adapter.notifyDataSetChanged()

    }

    fun updateList() {
        Realm.getDefaultInstance().use { realm ->
            adapter.programs = realm.where(TrainingSessionProgram::class.java).findAll()
            adapter.notifyDataSetChanged()
        }
    }

}
