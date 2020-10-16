package it.ninespartans.dinamo

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import io.realm.kotlin.where
import it.ninespartans.dinamo.model.TrainingProgram
import kotlinx.android.synthetic.main.activity_create_program.*
import kotlinx.android.synthetic.main.content_create_program.*
import kotlinx.android.synthetic.main.content_create_program.cancelButton
import java.util.*

class CreateProgramActivity : AppCompatActivity() {
    private var program: TrainingProgram? = null
    private var programId: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_program)
        setSupportActionBar(toolbar)
// Sensibilità della palla
        intent.getStringExtra("program_id")?.let {
            programId = it
        }

        programId?.let {
            title = getString(R.string.title_activity_update_program)
            saveProgram.text = getString(R.string.title_program_save)

            Realm.getDefaultInstance().use { realm ->
                realm.where<TrainingProgram>().equalTo("id", it).findFirst()?.let {
                    this.program = it
                    this.nameInputText.editText?.setText(it.title)
                    this.roleInputText.editText?.setText(it.description)
                }
            }

        } ?: run {
            title = getString(R.string.title_activity_create_program)
            saveProgram.text = getString(R.string.title_program_create)
        }

        saveProgram.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                programId?.let {
                    realm.where<TrainingProgram>().equalTo("id", it).findFirst()?.let { player ->
                        realm.executeTransaction {
                            realm.copyToRealmOrUpdate(player.apply {
                                title = nameInputText.editText?.text.toString()
                                description = roleInputText.editText?.text.toString()
                            })
                        }
                    }
                    finish()
                } ?: run {
                    realm.executeTransaction {
                        program = it.copyToRealmOrUpdate(TrainingProgram().apply {
                            title = nameInputText.editText?.text.toString()
                            description = roleInputText.editText?.text.toString()
                            durationTime = 230
                            startDate = Date()
                        })
                        finish()
                    }
                }
            }
        }

        cancelButton.setOnClickListener {
            finish()
        }

    }

}
