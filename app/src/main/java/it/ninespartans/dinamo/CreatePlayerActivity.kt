package it.ninespartans.dinamo

import android.content.Intent
import android.os.Bundle
import android.view.KeyEvent
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.textfield.TextInputLayout
import io.realm.Realm
import io.realm.kotlin.where
import it.ninespartans.dinamo.model.Player

import kotlinx.android.synthetic.main.activity_create_player.*
import kotlinx.android.synthetic.main.content_create_player.*
import android.view.View.OnFocusChangeListener
import android.view.View
import android.app.Activity
import android.view.inputmethod.InputMethodManager
import kotlinx.android.synthetic.main.activity_create_player.toolbar


class CreatePlayerActivity : AppCompatActivity() {
    private var player: Player? = null
    private var playerId: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_player)
        setSupportActionBar(toolbar)
        title = getString(R.string.title_activity_create_player)

        intent.getStringExtra("player_id")?.let {
            playerId = it
        }

        nextButton.text = getString(R.string.title_activity_create_player_button)
        cancelButton.text = getString(R.string.title_activity_update_player_cancel_button)
        playerId?.let {
            nextButton.text = getString(R.string.title_activity_update_player_button)

            Realm.getDefaultInstance().use { realm ->
                realm.where<Player>().equalTo("id", playerId).findFirst()?.let {
                    this.player = it
                    this.nameInputText.editText?.setText(it.name)
                    this.roleInputText.editText?.setText(it.role)
                }
            }
        }

        nextButton.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                playerId?.let {
                    realm.where<Player>().equalTo("id", it).findFirst()?.let { player ->
                        realm.executeTransaction {
                            realm.copyToRealmOrUpdate(player.apply {
                                name = nameInputText.editText?.text.toString()
                                role = roleInputText.editText?.text.toString()
                            })
                        }
                    }
                    finish()

                } ?: run {
                    realm.executeTransaction {
                        player = it.copyToRealmOrUpdate(Player().apply {
                            name = nameInputText.editText?.text.toString()
                            role = roleInputText.editText?.text.toString()
                        })
                        val intent = Intent(this, DevicePairSearchActivity::class.java)
                        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
                        intent.putExtra("player_id", player?.id)
                        startActivity(intent)
                        finish()
                    }
                }
            }
        }

        cancelButton.setOnClickListener {
            finish()
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

