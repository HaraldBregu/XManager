package com.ninespartans.xmanager

import android.os.Bundle
import android.widget.ArrayAdapter
import androidx.appcompat.app.AppCompatActivity
import com.ninespartans.xmanager.databinding.ActivityCreateAccountBinding
import com.ninespartans.xmanager.model.Account
import io.realm.Realm
import io.realm.kotlin.where
import com.ninespartans.xmanager.model.User


class CreateAccountActivity : AppCompatActivity() {
    private lateinit var binding: ActivityCreateAccountBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityCreateAccountBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        val realm = Realm.getDefaultInstance()
        val account = realm.where<Account>().findFirst()
        account?.let { it ->
            val query = realm.where<User>()
            query.isNotNull("account")
            query.equalTo("account._id", it._id)
            query.findFirst()?.let { user ->
                binding.content.fullNameInputText.editText?.setText(user.fullname)
                binding.content.headlineInputText.editText?.setText(user.headline)
                binding.content.ageInputText.editText?.setText(user.age)
            }
        }

        binding.content.saveButton.setOnClickListener {
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

        binding.content.dropdownAgeText.setAdapter(
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
            fullname = binding.content.fullNameInputText.editText?.text.toString()
            headline = binding.content.headlineInputText.editText?.text.toString()
            age = binding.content.ageInputText.editText?.text.toString()
        })
    }

    fun updateUser(realm: Realm, user: User, _account: Account) {
        realm.copyToRealmOrUpdate(user.apply {
            account = _account
            fullname = binding.content.fullNameInputText.editText?.text.toString()
            headline = binding.content.headlineInputText.editText?.text.toString()
            age = binding.content.ageInputText.editText?.text.toString()
        })
    }

}
