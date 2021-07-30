package it.ninespartans.xmanager

import android.content.Intent
import android.os.Bundle
import android.os.Environment
import android.text.Editable
import android.text.TextWatcher
import android.text.method.ScrollingMovementMethod
import android.util.Log
import android.view.View
import android.widget.RadioButton
import android.widget.Toast
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import io.realm.Realm
import io.realm.RealmConfiguration
import io.realm.RealmList
import io.realm.kotlin.where
import it.ninespartans.xmanager.bluetooth.BLEManager
import it.ninespartans.xmanager.model.*

import kotlinx.android.synthetic.main.activity_device_pair_select.*
import kotlinx.android.synthetic.main.content_device_pair_select.*

class DevicePairSelectActivity : AppCompatActivity() {
    lateinit var deviceInfo: DeviceInfo
    private lateinit var player: Player
    var playerId: String = ""
    var animationType: Byte = 0u.toByte()
    var ledPosition: Byte = 0u.toByte()
    var hours: Byte = 0u.toByte()
    var minutes: Byte = 0u.toByte()
    var seconds: Byte = 0u.toByte()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_device_pair_select)
        setSupportActionBar(toolbar)

        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        intent.getStringExtra("player_id")?.let {
            playerId = it
        }

        setLeftDevice.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                realm.where<Player>().equalTo("id", playerId).findFirst()?.let {
                    this.player = it
                    realm.executeTransaction {
                        var device = realm.copyToRealmOrUpdate(Device().apply {
                            name = deviceInfo.name
                            firmwareVersion = deviceInfo.version
                            mac = deviceInfo.efuse_mac
                            ble_mac = deviceInfo.ble.mac
                            wifi_mac = deviceInfo.wifi.mac
                        })
                        this.player.leftDevice = device
                    }
                }
            }
        }

        setRightDevice.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                realm.where<Player>().equalTo("id", playerId).findFirst()?.let {
                    this.player = it
                    realm.executeTransaction {
                        var device = realm.copyToRealmOrUpdate(Device().apply {
                            name = deviceInfo.name
                            firmwareVersion = deviceInfo.version
                            mac = deviceInfo.efuse_mac
                            ble_mac = deviceInfo.ble.mac
                            wifi_mac = deviceInfo.wifi.mac
                        })
                        this.player.rightDevice = device
                    }
                }
            }
        }

        BLEManager.onCharacteristicRead = {

            val jsonString = it?.getStringValue(0)
            deviceInfo = Gson().fromJson<DeviceInfo>(jsonString, DeviceInfo::class.java)

            val gson = GsonBuilder().setPrettyPrinting().create()
            discovering_log_text.text = gson.toJson(deviceInfo)

            BLEManager.disableReading()
        }

        val scrollingMethod = ScrollingMovementMethod()
        discovering_log_text.movementMethod = scrollingMethod

        sleep.setOnClickListener {
            var array = byteArrayOf(Byte.MAX_VALUE, 0x01)
            BLEManager.write(array)
        }

        reboot.setOnClickListener {
            val array = byteArrayOf(Byte.MAX_VALUE, 0x00)
            BLEManager.write(array)
        }

        setUpdateUrl.setOnClickListener {
            var array = byteArrayOf(0x02)
            val byteInputInt = "https://gitlab.com/api/v4/projects/20772874/repository/files/dinamo_firmware_sketches%2FDinamoFirmware.ino.pico32.bin/raw?ref=master&private_token=1S_FpPnkbC5eyeWUmrYR".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
        }

        setUpdateUrlNil.setOnClickListener {
            var array = byteArrayOf(0x02)
            val byteInputInt = "-".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
        }

        setUpdateMode.setOnClickListener {
            var array = byteArrayOf(0x03)
            val byteInputInt = "1".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
            /*
            val array = byteArrayOf(Byte.MAX_VALUE, 0x01, 0x01)
            BLEManager.write(array)
            BLEManager.enableReading()
            */
        }

        setNoMode.setOnClickListener {
            var array = byteArrayOf(0x03)
            val byteInputInt = "0".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)

            /*
            val array = byteArrayOf(Byte.MAX_VALUE, 0x01, 0x00)
            BLEManager.write(array)
            BLEManager.enableReading()
            */
        }

        setSSID.setOnClickListener {
            var array = byteArrayOf(0x00)
            val byteInputInt = "FASTWEB-B41373".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
        }

        setPass.setOnClickListener {
            var array = byteArrayOf(0x01)
            val byteInputInt = "4J8EEMJYJ3".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
        }

        nextButton.setOnClickListener{

        }

        closeButton.setOnClickListener{
            val intent = Intent(this, MainActivity::class.java)
            intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            startActivity(intent)

            //finishAffinity()
            //finishAndRemoveTask()
            //finish()

            /*
            val i = Intent(applicationContext, MainActivity::class.java)        // Specify any activity here e.g. home or splash or login etc
            i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK)
            i.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
            i.putExtra("EXIT", true)
            startActivity(i)
            finish()
            */
        }

        /**
         * Program parameters
         * 1. Led position (top, topright, ecc)
         * 2. Animation to be applied (fixed, fade, blink ecc)
         * 3. Time duration Hours
         * 4. Time duration Minutes
         * 5. Time duration Seconds
         */
        setProgram.setOnClickListener {

            //Toast.makeText(this, hoursEditText?.text.toString(), Toast.LENGTH_SHORT).show()


            // Tipo di comando
            var commandByteArray = byteArrayOf(0x7E)

            hours = hoursEditText.text.toString().toByte()
            minutes = minutesEditText.text.toString().toByte()
            seconds = secondsEditText.text.toString().toByte()

            commandByteArray = commandByteArray.plus(
                byteArrayOf(
                    ledPosition,   // LED position (0, 1, 2, 3, 4)
                    animationType,          // Animation (fixed, blink, fade)
                    hours,   // Hours
                    minutes,   // Minutes
                    seconds)) // Seconds

            BLEManager.write(commandByteArray)
        }

    }

    override fun onStart() {
        super.onStart()

        BLEManager.enableReading()
    }

    override fun onResume() {
        super.onResume()
    }

    override fun onDestroy() {
        super.onDestroy()

        BLEManager.disableReading()
    }

    override fun onBackPressed() {
        super.onBackPressed()
    }

    override fun onSupportNavigateUp(): Boolean {
        super.onBackPressed()

        return super.onSupportNavigateUp()
    }

    fun onRadioButtonClicked(view: View) {
        if (view is RadioButton) {
            // Is the button now checked?
            val checked = view.isChecked

            // Check which radio button was clicked
            when (view.getId()) {
                R.id.radioStatic ->
                    if (checked) {
                        animationType = 0u.toByte()
                    }
                R.id.radioBlink ->
                    if (checked) {
                        animationType = 1u.toByte()
                    }
                R.id.radioFade ->
                    if (checked) {
                        animationType = 2u.toByte()
                    }
            }
        }
    }

    fun onRadioLedClicked(view: View) {
        if (view is RadioButton) {
            // Is the button now checked?
            val checked = view.isChecked

            // Check which radio button was clicked
            when (view.getId()) {
                R.id.ledPosition0 ->
                    if (checked) {
                        ledPosition = 0u.toByte()
                    }
                R.id.ledPosition1 ->
                    if (checked) {
                        ledPosition = 1u.toByte()
                    }
                R.id.ledPosition2 ->
                    if (checked) {
                        ledPosition = 2u.toByte()
                    }
                R.id.ledPosition3 ->
                    if (checked) {
                        ledPosition = 3u.toByte()
                    }
                R.id.ledPosition4 ->
                    if (checked) {
                        ledPosition = 4u.toByte()
                    }
            }
        }
    }



}
