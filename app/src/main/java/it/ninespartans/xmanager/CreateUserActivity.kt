package it.ninespartans.xmanager

import android.os.Bundle
import android.widget.ArrayAdapter
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import io.realm.kotlin.where
import it.ninespartans.xmanager.model.User

import kotlinx.android.synthetic.main.activity_create_user.*
import kotlinx.android.synthetic.main.content_create_user.*
import kotlinx.android.synthetic.main.row_main_header.*

class CreateUserActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_user)
        setSupportActionBar(toolbar)

        title = getString(R.string.title_activity_create_profile)

        Realm.getDefaultInstance().use { realm ->
            realm.where<User>().findFirst()?.let {
                fullNameInputText.editText?.setText(it.fullName)
                headlineInputText.editText?.setText(it.headline)
                ageInputText.editText?.setText(it.age)
            }
        }

        saveButton.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                realm.executeTransaction {
                    realm.where<User>().findFirst()?.let { user ->
                        realm.copyToRealmOrUpdate(user.apply {
                            fullName = fullNameInputText.editText?.text.toString()
                            headline = headlineInputText.editText?.text.toString()
                            age = ageInputText.editText?.text.toString()
                        })
                    } ?: run {
                        realm.copyToRealmOrUpdate(User().apply {
                            fullName = fullNameInputText.editText?.text.toString()
                            headline = headlineInputText.editText?.text.toString()
                            age = ageInputText.editText?.text.toString()
                        })
                    }
                }
            }
            finish()
        }


        var ages = arrayOf<String>()
        for (i in 18..50) {
            ages += i.toString()
        }

        dropdown_age_text.setAdapter(
            ArrayAdapter(this,
                R.layout.dropdown_role_item,
                ages))

    }

}
