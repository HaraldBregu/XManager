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
import com.ninespartans.xmanager.model.User
import kotlinx.android.synthetic.main.activity_create_user.toolbar
import kotlinx.android.synthetic.main.content_create_user.*
import org.bson.types.ObjectId


class CreateUserActivity : AppCompatActivity() {
    val realm = Realm.getDefaultInstance()
    private var user: User? = null
    private var userId: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_user)
        setSupportActionBar(toolbar)

        intent.getStringExtra("user_id")?.let { userId = it }

        nextButton.text = getString(R.string.activity_create_user_button_title)

        userId?.let {
            nextButton.text = getString(R.string.activity_update_user_button_title)
            val user = realm.where<User>()
            user.equalTo("_id", ObjectId(userId))
            user.findFirst()?.let {
                this.user = it
                this.nameInputText.editText?.setText(it.fullname)
                this.roleInputText.editText?.setText(it.role)
                this.ageInputText.editText?.setText(it.age)
            }
        }

        nextButton.setOnClickListener {
            userId?.let {

                val user = realm.where<User>()
                user.equalTo("_id", ObjectId(it))
                user.findFirst()?.let { user ->
                    realm.executeTransaction {
                        realm.copyToRealmOrUpdate(user.apply {
                            fullname = nameInputText.editText?.text.toString()
                            role = roleInputText.editText?.text.toString()
                            age = ageInputText.editText?.text.toString()
                        })
                    }
                }
                finish()
            } ?: run {

                realm.executeTransaction {
                    user = it.copyToRealmOrUpdate(User().apply {
                        fullname = nameInputText.editText?.text.toString()
                        role = roleInputText.editText?.text.toString()
                        age = ageInputText.editText?.text.toString()
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

        containerSection.setOnClickListener {
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
        dropdown_role_text.setAdapter(
            ArrayAdapter(this,
                R.layout.dropdown_role_item,
                arrayOf("Attacante", "Difensore")))

        /**
         * Ages list
         */
        var ages = arrayOf<String>()
        for (i in 8..20) { ages += i.toString() }
        dropdown_age_text.setAdapter(
            ArrayAdapter(this,
                R.layout.dropdown_role_item,
                ages))

        roleInputText.onFocusChangeListener = View.OnFocusChangeListener { view, hasFocus ->
            if (hasFocus) {
                view.clearFocus()
                view.hideKeyboard()
            }
        }
        roleInputText.setOnClickListener {
            val inputMethodManager = getSystemService(Activity.INPUT_METHOD_SERVICE) as InputMethodManager
            inputMethodManager.hideSoftInputFromWindow(it?.applicationWindowToken, 0)
        }

        dropdown_role_text.setOnItemClickListener { adapterView, view, i, l ->
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
                builderInner.setNegativeButton("Cancel") { dialog, which ->
                    dialog.dismiss()
                }
                builderInner.setPositiveButton("Delete") { dialog, which ->
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

