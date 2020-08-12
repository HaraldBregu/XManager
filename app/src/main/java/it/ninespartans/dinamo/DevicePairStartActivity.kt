package it.ninespartans.dinamo

import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.os.Bundle
import android.util.Log
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat

import kotlinx.android.synthetic.main.activity_device_pair_start.*
import kotlinx.android.synthetic.main.content_device_pair_start.*

class DevicePairStartActivity : AppCompatActivity() {
    private var m_bluetoothAdapter: BluetoothAdapter? = null
    private val REQUEST_ENABLE_BLUETOOTH = 1
    private val COARSE_FINE_LOCATION = 1
    private val FINE_LOCATION = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_start)
        setSupportActionBar(toolbar)

        m_bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()
        if (m_bluetoothAdapter == null) {
            finish()
            Toast.makeText(this, "This device doesn't support bluetooth", Toast.LENGTH_LONG).show()
            return
        }

        update()

        activateBluetooth.setOnClickListener {
            if (!BluetoothAdapter.getDefaultAdapter().isEnabled) {
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
        debugString = if (bluetoothAdapter.isEnabled) "BLUETOOTH: ENABLED \n" else "BLUETOOTH: DISABLED \n"
        debugString += if (bluetoothIsActive) "BLUETOOTH: GRANTED \n" else "BLUETOOTH: DENIED \n"
        debugString += if(bluetoothAdminIsActive) "BLUETOOTH ADMIN: GRANTED \n" else "BLUETOOTH ADMIN: DENIED \n"
        debugString += if(coarseLocationIsGranted) "COARSE LOCATION: GRANTED \n" else "COARSE LOCATION: DENIED \n"
        debugString += if(fineLocationGranted) "FINE LOCATION: GRANTED \n" else "FINE LOCATION: DENIED \n"
        debugTextView.text = debugString

        nextButton.isEnabled = nextEnabled && bluetoothAdapter.isEnabled
        nextButton.isClickable = nextEnabled && bluetoothAdapter.isEnabled

        activateBluetooth.isEnabled = !bluetoothAdapter.isEnabled
        activateBluetooth.isClickable = !bluetoothAdapter.isEnabled

        activateCoarseLocation.isEnabled = !coarseLocationIsGranted
        activateCoarseLocation.isClickable = !coarseLocationIsGranted

        activateFineLocation.isEnabled = !fineLocationGranted
        activateFineLocation.isClickable = !fineLocationGranted
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

    /**
     * Util function
     * Function to check if some permission is granted
     */
    fun isPermissionGranted(permission:String):Boolean = ContextCompat.checkSelfPermission(this, permission) == PackageManager.PERMISSION_GRANTED

    var bluetoothIsActive: Boolean = false
        get() = isPermissionGranted(android.Manifest.permission.BLUETOOTH)

    var bluetoothAdminIsActive: Boolean = false
        get() = isPermissionGranted(android.Manifest.permission.BLUETOOTH_ADMIN)

    var coarseLocationIsGranted: Boolean = false
        get() = isPermissionGranted(android.Manifest.permission.ACCESS_COARSE_LOCATION)

    var fineLocationGranted: Boolean = false
        get() = isPermissionGranted(android.Manifest.permission.ACCESS_FINE_LOCATION)

    var nextEnabled: Boolean = false
        get() = bluetoothIsActive && bluetoothAdminIsActive && coarseLocationIsGranted && fineLocationGranted
}
