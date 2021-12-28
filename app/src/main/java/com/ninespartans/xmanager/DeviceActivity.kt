package com.ninespartans.xmanager

import android.bluetooth.BluetoothGatt
import android.bluetooth.BluetoothProfile
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import com.ninespartans.xmanager.bluetooth.BLEManager
import com.ninespartans.xmanager.databinding.ActivityDeviceBinding
import com.ninespartans.xmanager.model.Device
import com.ninespartans.xmanager.model.User
import io.realm.Realm
import io.realm.kotlin.where
import org.bson.types.ObjectId
import java.util.*

class DeviceActivity : AppCompatActivity() {
    private lateinit var binding: ActivityDeviceBinding
    private val realm = Realm.getDefaultInstance()
    private var device: Device? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityDeviceBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        title = "Dispositivo"
        binding.content.headerTitle.text = "Dispositivo associato"
        binding.content.headerDescription.text = "Informazioni del dispositvo associato al utente: x"

        val deviceId = intent.getStringExtra("device_id")

        /** Show Player Name */
        val device = realm.where<Device>()
        device.equalTo("_id", ObjectId(deviceId))
        device.findFirst()?.let {
            this.device = it
            binding.content.deviceName.text = "Nome dispositivo: ".plus(it.name)
            binding.content.deviceVersion.text = "Versione: ".plus(it.version)
            binding.content.deviceType.text = "Tipo: ".plus(it.type)
            binding.content.deviceBleMac.text = "BLE MAC: ".plus(it.ble_mac)
            binding.content.deviceProgram.text = "Programma caricato: ".plus(it.program?.title)
            binding.content.deviceUser.text = "Utente: ".plus(it.user?.fullname)
            binding.content.deviceConnectionState.text = "Stato connessione: ".plus("NON CONNESSO")
            updateActiveState()
        }

        binding.content.turnOffButton.setOnClickListener {
            /** Get Device BLE MAC Address */
            this.device?.ble_mac?.let { BLEManager.getDevice(it.uppercase(Locale.ROOT)) }

            /** Disconnect and Connect to BLE */
            BLEManager.disconnectDevice({
                BLEManager.connectDevice(this)
            }, 2000)

            /** Listen BLE connection changes */
            BLEManager.onConnectionStateChange = { gatt, status, newState ->
                if (status != BluetoothGatt.GATT_SUCCESS) {
                    runOnUiThread {
                        //descriptionProgress?.text = getString(R.string.upload_program_sheet_state_error_connection_title)
                    }
                    Handler(Looper.getMainLooper()).postDelayed({
                        //this.uploadProgramToDevice(deviceProgram, devices, deviceIndex + 1)
                    }, 2000)
                }
                when (newState) {
                    BluetoothProfile.STATE_DISCONNECTED -> {
                        runOnUiThread {
                            binding.content.deviceConnectionState.text = "Stato connessione: ".plus("NON CONNESSO")
                        }
                    }
                    BluetoothProfile.STATE_CONNECTED -> {
                        runOnUiThread {
                            binding.content.deviceConnectionState.text = "Stato connessione: ".plus("CONNESSO")
                        }
                    }
                }
            }

            /** Listen BLE services discovered and Start uploading program */
            BLEManager.onServiceDiscovered = {
                runOnUiThread {
                    var array = byteArrayOf(Byte.MAX_VALUE, 0x01)
                    BLEManager.write(array)
                }
            }

            /** Listen Data when are writed */
            BLEManager.onCharacteristicWrite = {
                /** Disconnect device after writing */
                BLEManager.disconnectDevice()
            }
        }


        binding.content.changeStateButton.setOnClickListener {
            realm.executeTransaction {
                this.device?.let {
                    it.active = !it.active
                }
                updateActiveState()
            }
        }
    }

    fun updateActiveState() {
        this.device?.let {
            binding.content.deviceState.text = "Stato: ".plus(if (it.active) "ATTIVO" else "NON ATTIVO")
            binding.content.changeStateButton.text = if (it.active) "DISATTIVA DISPOSITIVO" else "ATTIVA DISPOSITIVO"
        }
    }
}