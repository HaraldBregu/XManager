package it.ninespartans.dinamo

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import it.ninespartans.dinamo.model.Program

import kotlinx.android.synthetic.main.activity_create_program.*
import kotlinx.android.synthetic.main.content_create_player.nameInputText
import kotlinx.android.synthetic.main.content_create_player.roleInputText
import kotlinx.android.synthetic.main.content_create_program.*
import java.util.*

class CreateProgramActivity : AppCompatActivity() {
    private var program: Program? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_program)
        setSupportActionBar(toolbar)

        title = getString(R.string.title_activity_create_program)

        saveProgram.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                realm.executeTransaction {
                    program?.let {
                        realm.copyToRealmOrUpdate(it.apply {
                            title = nameInputText.editText?.text.toString()
                            description = roleInputText.editText?.text.toString()
                            durationTime = 230
                            startDate = Date()
                        })
                    } ?: run {
                        program = realm.createObject(Program::class.java)
                        program?.title = nameInputText.editText?.text.toString()
                        program?.description = roleInputText.editText?.text.toString()
                        program?.durationTime = 230
                        program?.startDate = Date()
                    }
                    finish()
                }
            }
        }

        cancelButton.setOnClickListener {
            finish()
        }

    }

}
