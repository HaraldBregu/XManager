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
import kotlinx.android.synthetic.main.activity_main.*


class CreatePlayerActivity : AppCompatActivity() {
    private var player: Player? = null
    private var playerId: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_player)
        setSupportActionBar(toolbar)
        //supportActionBar?.setDisplayHomeAsUpEnabled(true)
        title = getString(R.string.title_activity_create_player)


        intent.getStringExtra("player_id")?.let {
            playerId = it
        }

        //nameInputText.imeOptions = EditorInfo.IME_ACTION_DONE


        Realm.getDefaultInstance().use { realm ->
            realm.where<Player>().equalTo("id", playerId).findFirst()?.let {
                this.player = it
            }
        }

        nextButton.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                realm.executeTransaction {
                    player = realm.copyToRealmOrUpdate(Player().apply {
                        name = nameInputText.editText?.text.toString()

                    })
                    val intent = Intent(this, DevicePairSearchActivity::class.java)
                    intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
                    intent.putExtra("player_id", player?.id)
                    startActivity(intent)
                    finish()
                }

            }
        }

        cancelButton.setOnClickListener {
            finish()
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
}
