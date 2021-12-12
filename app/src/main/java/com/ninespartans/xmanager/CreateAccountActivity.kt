package com.ninespartans.xmanager

import android.os.Bundle
import android.view.View
import android.widget.ArrayAdapter
import androidx.appcompat.app.AppCompatActivity
import com.ninespartans.xmanager.model.Account
import io.realm.Realm
import io.realm.kotlin.where
import com.ninespartans.xmanager.model.User
import kotlinx.android.synthetic.main.activity_create_user.*
import kotlinx.android.synthetic.main.content_create_account.*
import kotlinx.android.synthetic.main.content_create_user.ageInputText
import kotlinx.android.synthetic.main.content_create_user.dropdown_age_text
import kotlinx.android.synthetic.main.row_main_header.view.*

class CreateAccountActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_account)
        setSupportActionBar(toolbar)

        val realm = Realm.getDefaultInstance()
        val account = realm.where<Account>().findFirst()
        account?.let { it ->
            val query = realm.where<User>()
            query.isNotNull("account")
            query.equalTo("account._id", it._id)
            query.findFirst()?.let { user ->
                fullNameInputText.editText?.setText(user.fullname)
                headlineInputText.editText?.setText(user.headline)
                ageInputText.editText?.setText(user.age)
            }
        }

        saveButton.setOnClickListener {
            realm.executeTransaction { it ->
                account?.let {

                    updateAccount(realm, it)
                } ?: run {
                    createNewAccount(realm)
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

    fun createNewAccount(realm: Realm) {
        realm.copyToRealmOrUpdate(Account().apply {
            val query = realm.where<User>()
            query.isNotNull("account")
            query.equalTo("account._id", this._id)
            query.findFirst()?.let { user ->
                updateUser(realm, user, this)
            } ?: run {
                createUser(realm, this)
            }
        })
    }

    fun updateAccount(realm: Realm, account: Account) {
        realm.copyToRealmOrUpdate(account.apply {
            val query = realm.where<User>()
            query.isNotNull("account")
            query.equalTo("account._id", this._id)
            query.findFirst()?.let { user ->
                updateUser(realm, user, this)
            } ?: run {
                createUser(realm, this)
            }
        })
    }

    fun createUser(realm: Realm, _account: Account) {
        realm.copyToRealmOrUpdate(User().apply {
            account = _account
            fullname = fullNameInputText.editText?.text.toString()
            headline = headlineInputText.editText?.text.toString()
            age = ageInputText.editText?.text.toString()
        })
    }

    fun updateUser(realm: Realm, user: User, _account: Account) {
        realm.copyToRealmOrUpdate(user.apply {
            account = _account
            fullname = fullNameInputText.editText?.text.toString()
            headline = headlineInputText.editText?.text.toString()
            age = ageInputText.editText?.text.toString()
        })
    }

}
