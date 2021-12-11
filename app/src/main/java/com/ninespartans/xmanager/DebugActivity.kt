package com.ninespartans.xmanager

import android.os.Bundle
import androidx.appcompat.app.AppCompatActivity

import kotlinx.android.synthetic.main.activity_debug.*

class DebugActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_debug)
        setSupportActionBar(toolbar)

    }

}
