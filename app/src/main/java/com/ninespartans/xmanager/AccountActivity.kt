package com.ninespartans.xmanager

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView
import com.ninespartans.xmanager.databinding.ActivityAccountBinding
import com.ninespartans.xmanager.model.Account
import com.ninespartans.xmanager.model.User
import io.realm.Realm
import io.realm.kotlin.where

class AccountActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAccountBinding
    private val realm: Realm = Realm.getDefaultInstance()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAccountBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        title = "Account"
        val account = realm.where<Account>().findFirst()
        account?.let { it ->
            val query = realm.where<User>()
            query.isNotNull("account")
            query.equalTo("account._id", it._id)
            query.findFirst()?.let { user ->

            }
        }

        binding.content.xmanagerTitle.text = getText(applicationInfo.labelRes)
        binding.content.xmanagerDescription.text = "Versione attuale: ${BuildConfig.VERSION_NAME} (${BuildConfig.VERSION_CODE})"
        binding.content.xmanagerVersionSection.setOnClickListener {
            val intent = Intent(this, AppVersionActivity::class.java)
            startActivity(intent)
        }

        binding.content.dinamoVersionTitle.text = "Dinamo"
        binding.content.dinamoVersionDescription.text = "Scarica e installa le ultime versioni firmware"
        binding.content.dinamoVersionSection.setOnClickListener {
            val intent = Intent(this, DinamoVersionActivity::class.java)
            startActivity(intent)
        }

    }
}