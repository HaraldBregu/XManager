package it.ninespartans.xmanager

import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.opengl.Visibility
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import it.ninespartans.xmanager.bluetooth.BLEManager

import kotlinx.android.synthetic.main.activity_device_pair_start.*
import kotlinx.android.synthetic.main.content_device_pair_start.*

class DevicePairStartActivity : AppCompatActivity() {
    private val REQUEST_ENABLE_BLUETOOTH = 1
    private val COARSE_FINE_LOCATION = 1
    private val FINE_LOCATION = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_start)
        setSupportActionBar(toolbar)

        if (BLEManager.adapter == null) {
            finish()
            Toast.makeText(this, "This device doesn't support bluetooth", Toast.LENGTH_LONG).show()
            return
        }

        update()

        activateBluetooth.setOnClickListener {
            if (!BLEManager.adapterEnabled) {
                val enableBluetoothIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
                startActivityForResult(enableBluetoothIntent, REQUEST_ENABLE_BLUETOOTH)
            }
        }

        activateCoarseLocation.setOnClickListener {
            ActivityCompat.requestPermissions(this, arrayOf(android.Manifest.permission.ACCESS_COARSE_LOCATION), COARSE_FINE_LOCATION)
        }

        activateFineLocation.setOnClickListener {
            ActivityCompat.requestPermissions(this, arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION), FINE_LOCATION)
        }

        nextButton.setOnClickListener {
            val intent = Intent(this, DevicePairSearchActivity::class.java)
            startActivity(intent)
        }

        closeButton.setOnClickListener {
            finish()
        }

        val bluetoothIntentFilter = IntentFilter()
        bluetoothIntentFilter.addAction(BluetoothAdapter.ACTION_STATE_CHANGED)
        registerReceiver(onBroadcastReceiver, bluetoothIntentFilter)
    }

    override fun onBackPressed() {
        super.onBackPressed()
        //overridePendingTransition(R.anim.bottom_down, R.anim.nothing)
    }

    override fun onSupportNavigateUp(): Boolean {
        finish()
        return super.onSupportNavigateUp()
    }

    override fun onStart() {
        super.onStart()
    }

    override fun onDestroy() {
        super.onDestroy()
        unregisterReceiver(onBroadcastReceiver)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        update()

        /**
         * Check if we are requesting to enable the Bluetooth
         */
        if (requestCode == REQUEST_ENABLE_BLUETOOTH) {

            Log.d("XBLUETOOTH", requestCode.toString())

            when (requestCode) {
                Activity.RESULT_OK -> {
                    /**
                     * Get BluetootAdapter only if is not null
                     */
                    //var bluetoothAdapter = m_bluetoothAdapter?.takeIf { it != null } ?: return

                    /**
                     * Change state of textview
                     */
                    Toast.makeText(this, "Enable bluetooth done", Toast.LENGTH_LONG).show()
                    update()

                    //ble_state_value.text = if (bluetoothAdapter.isEnabled) "ENABLED" else "DISABLED"
                }
                Activity.RESULT_CANCELED -> {
                    Toast.makeText(this, "Enable bluetooth has been cancelled", Toast.LENGTH_LONG).show()
                    update()
                }
            }
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        when (requestCode) {
            FINE_LOCATION -> {
                if (grantResults.isEmpty() || grantResults[0] != PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this, "FINE_LOCATION CANCELLED", Toast.LENGTH_LONG).show()
                } else {
                    Toast.makeText(this, "FINE_LOCATION ALLOWED", Toast.LENGTH_LONG).show()
                }
                update()
            }
            COARSE_FINE_LOCATION -> {
                if (grantResults.isEmpty() || grantResults[0] != PackageManager.PERMISSION_GRANTED) {
                    Toast.makeText(this, "COARSE_FINE_LOCATION CANCELLED", Toast.LENGTH_LONG).show()
                } else {
                    Toast.makeText(this, "COARSE_FINE_LOCATION ALLOWED", Toast.LENGTH_LONG).show()
                }
                update()
            }
        }
    }

    private fun update() {
        var bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()?.takeIf { it != null } ?: return

        var debugString = ""
        debugString = if (BLEManager.bleIsEnabled()) "BLUETOOTH: ENABLED \n" else "BLUETOOTH: DISABLED \n"
        debugString += if (BLEManager.bleGranted(this)) "BLUETOOTH: GRANTED \n" else "BLUETOOTH: DENIED \n"
        debugString += if(BLEManager.bleAdminGranted(this)) "BLUETOOTH ADMIN: GRANTED \n" else "BLUETOOTH ADMIN: DENIED \n"
        debugString += if(BLEManager.coarseLocationGranted(this)) "COARSE LOCATION: GRANTED \n" else "COARSE LOCATION: DENIED \n"
        debugString += if(BLEManager.fineLocationGranted(this)) "FINE LOCATION: GRANTED \n" else "FINE LOCATION: DENIED \n"
        debugTextView.text = debugString

        //nextButton.isEnabled = nextEnabled && bluetoothAdapter.isEnabled
        //nextButton.isClickable = nextEnabled && bluetoothAdapter.isEnabled

        activateBluetooth.visibility = when (bluetoothAdapter.isEnabled) {
            true -> View.GONE
            false -> View.VISIBLE
        }
        //activateBluetooth.isEnabled = !bluetoothAdapter.isEnabled
        //activateBluetooth.isClickable = !bluetoothAdapter.isEnabled

        activateCoarseLocation.visibility = when (BLEManager.coarseLocationGranted(this)) {
            true -> View.GONE
            false -> View.VISIBLE
        }
        //activateCoarseLocation.isEnabled = !BLEManager.coarseLocationGranted(this)
        //activateCoarseLocation.isClickable = !BLEManager.coarseLocationGranted(this)

        activateFineLocation.visibility = when (BLEManager.fineLocationGranted(this)) {
            true -> View.GONE
            false -> View.VISIBLE
        }
        //activateFineLocation.isEnabled = !BLEManager.fineLocationGranted(this)
        //activateFineLocation.isClickable = !BLEManager.fineLocationGranted(this)
    }

    /**
     * BroadcastReceiver
     * Object class to manage the broadcasting
     */
    private val onBroadcastReceiver = object : BroadcastReceiver() {

        override fun onReceive(contxt: Context?, intent: Intent?) {
            when(intent?.action) {
                BluetoothAdapter.ACTION_STATE_CHANGED -> {
                    var bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()?.takeIf { it != null } ?: return
                    when (bluetoothAdapter.state) {

                        BluetoothAdapter.STATE_TURNING_ON -> {
                            Toast.makeText(
                                this@DevicePairStartActivity,
                                "BLUETOOTH TURNING ON",
                                Toast.LENGTH_SHORT
                            ).show()

                        }

                        BluetoothAdapter.STATE_TURNING_OFF -> {
                            Toast.makeText(
                                this@DevicePairStartActivity,
                                "BLUETOOTH TURNING OFF",
                                Toast.LENGTH_SHORT
                            ).show()

                        }
                    }

                    update()
                }
            }
        }
    }
}
