package it.ninespartans.xmanager

import android.os.Bundle
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity

import kotlinx.android.synthetic.main.activity_debug.*

class DebugActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(it.ninespartans.xmanager.R.layout.activity_debug)
        setSupportActionBar(toolbar)

    }

}
