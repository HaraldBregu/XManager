package com.ninespartans.xmanager

import android.app.Activity
import android.app.AlertDialog
import android.content.Intent
import android.os.Bundle
import android.view.KeyEvent
import android.view.Menu
import android.view.MenuItem
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import io.realm.kotlin.where
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.ArrayAdapter
import com.ninespartans.xmanager.databinding.ActivityCreateUserBinding
import com.ninespartans.xmanager.model.User
import org.bson.types.ObjectId


class CreateUserActivity : AppCompatActivity() {
    private lateinit var binding: ActivityCreateUserBinding
    private val realm: Realm = Realm.getDefaultInstance()
    private var user: User? = null
    private var userId: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityCreateUserBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        intent.getStringExtra("user_id")?.let { userId = it }

        binding.content.nextButton.text = getString(R.string.activity_create_user_button_title)

        userId?.let {
            binding.content.nextButton.text = getString(R.string.activity_update_user_button_title)
            val user = realm.where<User>()
            user.equalTo("_id", ObjectId(userId))
            user.findFirst()?.let {
                this.user = it
                this.binding.content.nameInputText.editText?.setText(it.fullname)
                this.binding.content.roleInputText.editText?.setText(it.role)
                this.binding.content.ageInputText.editText?.setText(it.age)
            }
        }

        binding.content.nextButton.setOnClickListener {
            userId?.let {

                val user = realm.where<User>()
                user.equalTo("_id", ObjectId(it))
                user.findFirst()?.let { _user ->
                    realm.executeTransaction {
                        realm.copyToRealmOrUpdate(_user.apply {
                            fullname = binding.content.nameInputText.editText?.text.toString()
                            role = binding.content.roleInputText.editText?.text.toString()
                            age = binding.content.ageInputText.editText?.text.toString()
                        })
                    }
                }
                finish()
            } ?: run {

                realm.executeTransaction {
                    user = it.copyToRealmOrUpdate(User().apply {
                        fullname = binding.content.nameInputText.editText?.text.toString()
                        role = binding.content.roleInputText.editText?.text.toString()
                        age = binding.content.ageInputText.editText?.text.toString()
                    })

                    val intent = Intent(this, DeviceSearchActivity::class.java)
                    intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
                    intent.putExtra("user_id", user?._id.toString())
                    intent.putExtra("user_fullname", user?.fullname)
                    startActivity(intent)
                    finish()
                }
            }
        }

        /*
        containerSection.setOnTouchListener { view, motionEvent ->
            val inputMethodManager = getSystemService(Activity.INPUT_METHOD_SERVICE) as InputMethodManager
            inputMethodManager.hideSoftInputFromWindow(view?.getWindowToken(), 0)

            //val imm = getSystemService(Context.INPUT_METHOD_SERVICE) as InputMethodManager
            //imm.hideSoftInputFromWindow(currentFocus!!.windowToken, 0)
            //return true
        }*/

        binding.content.containerSection.setOnClickListener {
            //it.clearFocus()
            it.hideKeyboard()
        }



        /*
        nameInputText.editText?.setOnFocusChangeListener(object : OnFocusChangeListener {
            override fun onFocusChange(view: View?, hasFocus: Boolean) {
                if (!hasFocus) {
                    val inputMethodManager = getSystemService(Activity.INPUT_METHOD_SERVICE) as InputMethodManager
                    inputMethodManager!!.hideSoftInputFromWindow(view?.getWindowToken(), 0)
                }
            }
        })*/

        /**
         * Roles list
         */
        binding.content.dropdownRoleText.setAdapter(
            ArrayAdapter(this,
                R.layout.dropdown_role_item,
                arrayOf("Attacante", "Difensore")))

        /**
         * Ages list
         */
        var ages = arrayOf<String>()
        for (i in 8..20) { ages += i.toString() }
        binding.content.dropdownAgeText.setAdapter(
            ArrayAdapter(this,
                R.layout.dropdown_role_item,
                ages))

        binding.content.roleInputText.onFocusChangeListener = View.OnFocusChangeListener { view, hasFocus ->
            if (hasFocus) {
                view.clearFocus()
                view.hideKeyboard()
            }
        }
        binding.content.roleInputText.setOnClickListener {
            val inputMethodManager = getSystemService(Activity.INPUT_METHOD_SERVICE) as InputMethodManager
            inputMethodManager.hideSoftInputFromWindow(it?.applicationWindowToken, 0)
        }

        binding.content.dropdownRoleText.setOnItemClickListener { adapterView, view, i, l ->
            val inputMethodManager = getSystemService(Activity.INPUT_METHOD_SERVICE) as InputMethodManager
            inputMethodManager.hideSoftInputFromWindow(view?.applicationWindowToken, 0)
        }

        /*



        roleInputText.isFocusableInTouchMode = true
        roleInputText.onFocusChangeListener = View.OnFocusChangeListener { view, hasFocus ->
            if (hasFocus) {
                view.hideKeyboard()
            }
        }

        ageInputText.isFocusableInTouchMode = true
        ageInputText.onFocusChangeListener = View.OnFocusChangeListener { view, hasFocus ->
            if (hasFocus) {
                view.hideKeyboard()
            }
        }*/
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_user, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.action_options -> {
                val builderInner = AlertDialog.Builder(this)
                builderInner.setTitle("Attention!")
                builderInner.setMessage("Before deleting the Player be sure that you don't need it anymore. All pairing devices and data will be deleted permanently from the app.")
                builderInner.setNegativeButton("Cancel") { dialog, _ ->
                    dialog.dismiss()
                }
                builderInner.setPositiveButton("Delete") { _, _ ->
                    realm.executeTransaction {
                        user?.deleteFromRealm()
                        finish()
                    }
                }
                builderInner.show()
                return true
            }
            else -> super.onOptionsItemSelected(item)
        }
    }

    override fun onKeyUp(keyCode: Int, event: KeyEvent?): Boolean {
        return super.onKeyUp(keyCode, event)
    }

    override fun onKeyDown(keyCode: Int, event: KeyEvent?): Boolean {
        return super.onKeyDown(keyCode, event)
    }

    fun View.hideKeyboard() {
        val inputMethodManager = context!!.getSystemService(android.content.Context.INPUT_METHOD_SERVICE) as? InputMethodManager
        inputMethodManager?.hideSoftInputFromWindow(this.windowToken, 0)
    }
}

