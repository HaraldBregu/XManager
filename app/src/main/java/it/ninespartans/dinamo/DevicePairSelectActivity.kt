package it.ninespartans.dinamo

import android.content.Intent
import android.os.Bundle
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import it.ninespartans.dinamo.bluetooth.BLEManager

import kotlinx.android.synthetic.main.activity_device_pair_select.*
import kotlinx.android.synthetic.main.content_device_pair_start.*

class DevicePairSelectActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_select)
        setSupportActionBar(toolbar)

        supportActionBar?.setDisplayHomeAsUpEnabled(true)


        nextButton.setOnClickListener {
            val intent = Intent(this, DevicePairSetupActivity::class.java)
            //intent.putExtra("selected_device", deviceSelected)
            startActivity(intent)
        }

        //BLEManager.connectDevice(this)
    }

    override fun onStart() {
        super.onStart()

        BLEManager.read()

    }

    override fun onResume() {
        super.onResume()
    }

    override fun onDestroy() {
        super.onDestroy()

    }

    override fun onBackPressed() {
        super.onBackPressed()
    }

    override fun onSupportNavigateUp(): Boolean {
        super.onBackPressed()

        return super.onSupportNavigateUp()
    }

}
