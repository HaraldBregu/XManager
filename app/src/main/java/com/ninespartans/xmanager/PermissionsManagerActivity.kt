package com.ninespartans.xmanager

import android.app.Activity
import android.bluetooth.BluetoothAdapter
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.Bundle
import android.util.Log
import android.view.View
import android.widget.Toast
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import com.ninespartans.xmanager.bluetooth.BLEManager
import android.net.Uri
import android.provider.Settings
import androidx.core.content.ContextCompat
import com.ninespartans.xmanager.databinding.ActivityPermissionsManagerBinding


class PermissionsManagerActivity : AppCompatActivity() {
    private lateinit var binding: ActivityPermissionsManagerBinding
    private val REQUEST_ENABLE_BLUETOOTH = 1
    private val FINE_LOCATION = 1

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPermissionsManagerBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        if (BLEManager.adapter == null) {
            finish()
            Toast.makeText(this, getString(R.string.activity_create_program_button_new_session), Toast.LENGTH_LONG).show()
            return
        }

        //update()

        binding.content.activateBluetooth.setOnClickListener {
            if (!BLEManager.adapterEnabled) {
                val enableBluetoothIntent = Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE)
                startActivityForResult(enableBluetoothIntent, REQUEST_ENABLE_BLUETOOTH)
            }
        }

        binding.content.activateGps.setOnClickListener {
            startActivity(Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS));
        }

        binding.content.activateFineLocation.setOnClickListener {
            ActivityCompat.requestPermissions(this, arrayOf(android.Manifest.permission.ACCESS_FINE_LOCATION), FINE_LOCATION)
        }

        binding.content.saveButton.setOnClickListener {
            finish()
/*
            if (BLEManager.canStart(this)) {
                val intent = Intent(this, DevicePairSearchActivity::class.java)
                startActivity(intent)
                finish()
            }*/
        }

        val bluetoothIntentFilter = IntentFilter()
        bluetoothIntentFilter.addAction(BluetoothAdapter.ACTION_STATE_CHANGED)
        registerReceiver(onBroadcastReceiver, bluetoothIntentFilter)

        binding.content.settingsSection.setOnClickListener {
            //finish()
            val intent = Intent(Settings.ACTION_APPLICATION_DETAILS_SETTINGS)
            intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            val uri = Uri.fromParts("package", packageName, null)
            intent.setData(uri)
            startActivity(intent)

        }
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
        update()
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

            //Log.d("XBLUETOOTH", requestCode.toString())

            when (requestCode) {
                Activity.RESULT_OK -> {
                    /**
                     * Get BluetootAdapter only if is not null
                     */
                    //var bluetoothAdapter = m_bluetoothAdapter?.takeIf { it != null } ?: return

                    /**
                     * Change state of textview
                     */
                    //Toast.makeText(this, "Enable bluetooth done", Toast.LENGTH_LONG).show()
                    update()

                    //ble_state_value.text = if (bluetoothAdapter.isEnabled) "ENABLED" else "DISABLED"
                }
                Activity.RESULT_CANCELED -> {
                    //Toast.makeText(this, "Enable bluetooth has been cancelled", Toast.LENGTH_LONG).show()
                    update()
                }
            }
        }
    }

    override fun onRequestPermissionsResult(requestCode: Int, permissions: Array<out String>, grantResults: IntArray) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults)

        when (requestCode) {
            FINE_LOCATION -> {
                /*
               if (grantResults.isEmpty() || grantResults[0] == PackageManager.PERMISSION_GRANTED) {
                   //Toast.makeText(this, "PERMISSION_GRANTED", Toast.LENGTH_LONG).show()
                   //update()
                }
               else if (ActivityCompat.shouldShowRequestPermissionRationale(this, permissions.first()) == false) {

                   val builderInner = AlertDialog.Builder(this)
                   builderInner.setTitle("Permessi di posizione")
                   builderInner.setMessage("Hai scelto di non richiedere più ")
                   builderInner.setNegativeButton("Annulla") { dialog, which ->
                       dialog.dismiss()
                   }
                   builderInner.setPositiveButton("Impostazioni") { dialog, which ->

                   }
                   builderInner.show()

               }
               else {
                    //Toast.makeText(this, "Permission Denied", Toast.LENGTH_LONG).show()

                 }
                 */
                update()
            }
        }
    }

    private fun update() {

        /**
         * Bluetooth
         */

        val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()?.takeIf { it != null } ?: return

        binding.content.activateBluetooth.visibility = when (bluetoothAdapter.isEnabled) {
            true -> View.GONE
            false -> View.VISIBLE
        }

        binding.content.bleStatusActiveSection.visibility = when (bluetoothAdapter.isEnabled) {
            true -> View.VISIBLE
            false -> View.GONE
        }

        /**
         * GPS
         */

        binding.content.activateGps.visibility = when (BLEManager.gpsEnabled(this)) {
            true -> View.GONE
            false -> View.VISIBLE
        }

        binding.content.gpsStatusActiveSection.visibility = when (BLEManager.gpsEnabled(this)) {
            true -> View.VISIBLE
            false -> View.GONE
        }

        /**
         * Fine Location
         */
        binding.content.settingsSection.visibility = View.GONE
        binding.content.settingsText.text = getString(R.string.activity_permissions_fine_location_go_to_settings_text)
        binding.content.activateFineLocation.visibility = View.VISIBLE
        binding.content.fineLocationStatusActiveSection.visibility = View.GONE

        if (BLEManager.fineLocationGranted(this)) {
            binding.content.activateFineLocation.visibility = View.GONE
            binding.content.fineLocationStatusActiveSection.visibility = View.VISIBLE
            binding.content.fineLocationStatusImage?.setImageResource(R.drawable.ic_check_circle_green_24dp)
            binding.content.fineLocationStatusImage?.setColorFilter(ContextCompat.getColor(this, R.color.colorSecondaryVariant))
            binding.content.fineLocationStatusTextView.text = getString(R.string.activity_permissions_fine_location_status_in_use_text)
        } else {
            if (ActivityCompat.shouldShowRequestPermissionRationale(this, android.Manifest.permission.ACCESS_FINE_LOCATION)) {
                binding.content.activateFineLocation.visibility = View.GONE
                binding.content.fineLocationStatusActiveSection.visibility = View.VISIBLE
                binding.content.fineLocationStatusImage?.setImageResource(R.drawable.ic_warning_24dp)
                binding.content.fineLocationStatusImage?.setColorFilter(ContextCompat.getColor(this, R.color.colorError))
                binding.content.fineLocationStatusTextView.text = getString(R.string.activity_permissions_fine_location_status_denied_text)
                binding.content.settingsSection.visibility = View.VISIBLE
            } else {

            }
        }

    }

    /**
     * BroadcastReceiver
     * Object class to manage the broadcasting
     */
    private val onBroadcastReceiver = object : BroadcastReceiver() {

        override fun onReceive(contxt: Context?, intent: Intent?) {
            when(intent?.action) {
                BluetoothAdapter.ACTION_STATE_CHANGED -> {
                    val bluetoothAdapter = BluetoothAdapter.getDefaultAdapter()?.takeIf { it != null } ?: return
                    when (bluetoothAdapter.state) {
                        BluetoothAdapter.STATE_ON -> {

                        }
                        BluetoothAdapter.STATE_OFF -> {

                        }
                        BluetoothAdapter.STATE_TURNING_ON -> {
                            Toast.makeText(
                                this@PermissionsManagerActivity,
                                "BLUETOOTH TURNING ON",
                                Toast.LENGTH_SHORT
                            ).show()

                        }

                        BluetoothAdapter.STATE_TURNING_OFF -> {
                            Toast.makeText(
                                this@PermissionsManagerActivity,
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
