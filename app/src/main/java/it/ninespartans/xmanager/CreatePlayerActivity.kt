package it.ninespartans.xmanager

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.view.KeyEvent
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import io.realm.kotlin.where
import it.ninespartans.xmanager.model.Player

import kotlinx.android.synthetic.main.content_create_player.*
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.AdapterView
import android.widget.ArrayAdapter
import kotlinx.android.synthetic.main.activity_create_player.toolbar




class CreatePlayerActivity : AppCompatActivity() {
    private var player: Player? = null
    private var playerId: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_player)
        setSupportActionBar(toolbar)

        intent.getStringExtra("player_id")?.let { playerId = it }

        title = getString(R.string.title_activity_create_player)
        header_title.text = "Player informations"
        header_description.text = "Insert the fullname of the player, the role and the age."
        nextButton.text = getString(R.string.title_activity_create_player_button)

        playerId?.let {

            title = getString(R.string.title_activity_update_player)
            header_title.text = "Player informations"
            header_description.text = "Update information about this player."
            nextButton.text = getString(R.string.title_activity_update_player_button)

            Realm.getDefaultInstance().use { realm ->
                realm.where<Player>().equalTo("id", playerId).findFirst()?.let {
                    this.player = it
                    this.nameInputText.editText?.setText(it.fullname)
                    this.roleInputText.editText?.setText(it.role)
                    this.ageInputText.editText?.setText(it.age)
                }
            }
        }

        nextButton.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                playerId?.let {
                    /**
                     * When player already exists
                     * Save new data
                     * close activity
                     */
                    realm.where<Player>().equalTo("id", it).findFirst()?.let { player ->
                        realm.executeTransaction {
                            realm.copyToRealmOrUpdate(player.apply {
                                fullname = nameInputText.editText?.text.toString()
                                role = roleInputText.editText?.text.toString()
                                age = ageInputText.editText?.text.toString()
                            })
                        }
                    }
                    finish()

                } ?: run {
                    /**
                     * When player doesn't exists
                     * Save new player
                     * Push to new activity
                     */
                    realm.executeTransaction {


                        player = it.copyToRealmOrUpdate(Player().apply {
                            fullname = nameInputText.editText?.text.toString()
                            role = roleInputText.editText?.text.toString()
                            age = ageInputText.editText?.text.toString()
                        })

                        val intent = Intent(this, DevicePairSearchActivity::class.java)
                        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
                        intent.putExtra("player_id", player?.id)
                        intent.putExtra("player_name", player?.fullname)
                        startActivity(intent)
                        finish()
                    }
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

