package com.ninespartans.xmanager

import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.text.method.ScrollingMovementMethod
import android.util.Log
import android.view.View
import android.widget.RadioButton
import androidx.appcompat.app.AppCompatActivity
import com.google.gson.Gson
import com.google.gson.GsonBuilder
import com.ninespartans.xmanager.model.Device
import io.realm.Realm
import io.realm.kotlin.where
import com.ninespartans.xmanager.bluetooth.BLEManager
import com.ninespartans.xmanager.databinding.ActivityBluetoothDebugBinding
import com.ninespartans.xmanager.model.DeviceInfo
import com.ninespartans.xmanager.model.User
import okhttp3.*
import okio.Okio
import java.io.*


class BluetoothDebugActivity : AppCompatActivity() {
    private lateinit var binding: ActivityBluetoothDebugBinding
    lateinit var deviceInfo: DeviceInfo
    private lateinit var player: User
    var playerId: String = ""
    var animationType: Byte = 0u.toByte()
    var ledPosition: Byte = 0u.toByte()
    var hours: Byte = 0u.toByte()
    var minutes: Byte = 0u.toByte()
    var seconds: Byte = 0u.toByte()

    val okClient by lazy {
        OkHttpClient()
    }
    val okRequest by lazy {
        val url = "https://gitlab.com/api/v4/projects/20772874/repository/files/bin%2Ftest-firmware.bin/raw?ref=master&private_token=1S_FpPnkbC5eyeWUmrYR"
        Request.Builder()
            .url(url)
            .build()
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityBluetoothDebugBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        supportActionBar?.setDisplayHomeAsUpEnabled(true)
        intent.getStringExtra("player_id")?.let {
            playerId = it
        }

        binding.content.setLeftDevice.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                realm.where<User>().equalTo("id", playerId).findFirst()?.let {
                    this.player = it
                    realm.executeTransaction {
                        var device = realm.copyToRealmOrUpdate(Device().apply {
                            name = deviceInfo.name
                            version = deviceInfo.version
                            mac = deviceInfo.efuse_mac
                            ble_mac = deviceInfo.ble.mac
                            wifi_mac = deviceInfo.wifi.mac
                        })
                        //this.player.leftDevice = device
                    }
                }
            }
        }

        binding.content.setRightDevice.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->
                realm.where<User>().equalTo("id", playerId).findFirst()?.let {
                    this.player = it
                    realm.executeTransaction {
                        var device = realm.copyToRealmOrUpdate(Device().apply {
                            name = deviceInfo.name
                            version = deviceInfo.version
                            mac = deviceInfo.efuse_mac
                            ble_mac = deviceInfo.ble.mac
                            wifi_mac = deviceInfo.wifi.mac
                        })
                        //this.player.rightDevice = device
                    }
                }
            }
        }

        BLEManager.onCharacteristicRead = {

            val jsonString = it?.getStringValue(0)
            deviceInfo = Gson().fromJson(jsonString, DeviceInfo::class.java)

            val gson = GsonBuilder().setPrettyPrinting().create()
            binding.content.discoveringLogText.text = gson.toJson(deviceInfo)

            BLEManager.disableReading()
        }

        val scrollingMethod = ScrollingMovementMethod()
        binding.content.discoveringLogText.movementMethod = scrollingMethod

        binding.content.sleep.setOnClickListener {
            var array = byteArrayOf(Byte.MAX_VALUE, 0x01)
            BLEManager.write(array)
        }

        binding.content.reboot.setOnClickListener {
            val array = byteArrayOf(Byte.MAX_VALUE, 0x00)
            BLEManager.write(array)
        }

        binding.content.setUpdateUrl.setOnClickListener {
            var array = byteArrayOf(0x02)
            val byteInputInt = "https://gitlab.com/api/v4/projects/20772874/repository/files/dinamo_firmware_sketches%2FDinamoFirmware.ino.pico32.bin/raw?ref=master&private_token=1S_FpPnkbC5eyeWUmrYR".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
        }

        binding.content.setUpdateUrlNil.setOnClickListener {
            var array = byteArrayOf(0x02)
            val byteInputInt = "-".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
        }

        binding.content.setUpdateMode.setOnClickListener {
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

        binding.content.setNoMode.setOnClickListener {
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

        binding.content.downloadBinary.setOnClickListener {
            okClient.newCall(okRequest).enqueue(object : Callback {
                override fun onFailure(call: Call, e: IOException) {
                    e.printStackTrace()
                    Log.e("DONWLOAD_BINARY", "onFailure")
                }

                override fun onResponse(call: Call, response: Response) {
                    val downloadedFile = File(cacheDir, "dinamo-alpha-0.9.0.bin")
                    val sink = Okio.buffer(Okio.sink(downloadedFile))
                    val source = response.body()?.source()
                    sink.writeAll(source)
                    sink.close()

                    Log.e("DONWLOAD_BINARY", "onResponse")

                    cacheDir.listFiles().forEach {
                        Log.e("DONWLOAD_BINARY", it.absolutePath)
                    }

                    cacheDir.listFiles().filter { it.canRead() &&  it.isFile && it.name.endsWith(".bin") }.map {
                        runOnUiThread {
                            val bytes = it.readBytes()
                            uploadChunk(512, 0, bytes)

                        }
                    }
                }
            })
        }

        binding.content.setSSID.setOnClickListener {
            var array = byteArrayOf(0x00)
            val byteInputInt = "FASTWEB-B41373".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
        }

        binding.content.setPass.setOnClickListener {
            var array = byteArrayOf(0x01)
            val byteInputInt = "4J8EEMJYJ3".toByteArray()
            array = array.plus(byteInputInt)
            BLEManager.write(array)
        }

        binding.content.nextButton.setOnClickListener{

        }

        binding.content.closeButton.setOnClickListener{
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
        binding.content.setProgram.setOnClickListener {

            //Toast.makeText(this, hoursEditText?.text.toString(), Toast.LENGTH_SHORT).show()


            // Tipo di comando
            var commandByteArray = byteArrayOf(0x7E)

            hours = binding.content.hoursEditText.text.toString().toByte()
            minutes = binding.content.minutesEditText.text.toString().toByte()
            seconds = binding.content.secondsEditText.text.toString().toByte()

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


    fun uploadChunk(size: Int=512, index: Int = 0, data: ByteArray) {
        Log.e("DONWLOAD_BINARY_firmware", data.size.toString())

        val binarySize = data.size

        val fromIndex = size * index
        Log.e("DONWLOAD_BINARY_from_index", fromIndex.toString())
       if (fromIndex >= (binarySize-1)) {
            return
        }

        var toIndex = fromIndex + size

        var isLast = false
        if (toIndex > (binarySize-1)) {
            isLast = true
            toIndex = binarySize
        }
        Log.e("DONWLOAD_BINARY_from_index", toIndex.toString())

        val chunkBytesArray = data.copyOfRange(fromIndex, toIndex)

        var bytesOTAKey = byteArrayOf(0x00) // Key
        bytesOTAKey = bytesOTAKey.plus(chunkBytesArray) // Data Byte Array

        Log.e("DONWLOAD_BINARY_size", bytesOTAKey.size.toString())

        BLEManager.write(bytesOTAKey)

        if (isLast) {
            return
        }

        val handler = Handler(Looper.getMainLooper())
        handler.postDelayed({
            uploadChunk(size, index+1, data)
        }, 2000)
    }

}
