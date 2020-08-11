package it.ninespartans.dinamo

import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity
import kotlinx.android.synthetic.main.activity_main.*
import android.view.Menu
import android.view.MenuItem
import kotlinx.android.synthetic.main.content_main.*

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        toolbar.title = "Dashboard"
        setSupportActionBar(toolbar)

        select_left_device.setOnClickListener {
            presentDevicePairActivity()
        }

        select_right_device.setOnClickListener {
            presentDevicePairActivity()
        }

    }

    private fun presentDevicePairActivity() {
        val intent = Intent(this, DevicePairStartActivity::class.java)
        startActivity(intent)
        overridePendingTransition(R.anim.bottom_up, R.anim.nothing)
    }

    override fun onCreateOptionsMenu(menu: Menu?): Boolean {
        menuInflater.inflate(R.menu.menu_main, menu)
        return super.onCreateOptionsMenu(menu)
    }

    override fun onOptionsItemSelected(item: MenuItem): Boolean {
        return when (item.itemId) {
            R.id.action_profile -> {
                val intent = Intent(this, SettingsActivity::class.java)
                startActivity(intent)

                return true
            }

            else -> super.onOptionsItemSelected(item)
        }
    }

}
