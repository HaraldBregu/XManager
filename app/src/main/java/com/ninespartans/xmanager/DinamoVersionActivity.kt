package com.ninespartans.xmanager

import android.app.DownloadManager
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Environment
import com.google.gson.Gson
import com.ninespartans.xmanager.adapters.DinamoVersionListAdapter
import com.ninespartans.xmanager.databinding.ActivityDinamoVersionBinding
import com.ninespartans.xmanager.model.DinamoInfo
import okhttp3.*
import java.io.File
import java.io.IOException

class DinamoVersionActivity : AppCompatActivity() {
    private lateinit var binding: ActivityDinamoVersionBinding
    private lateinit var adapter: DinamoVersionListAdapter

    val okClient by lazy { OkHttpClient() }
    val url = "https://gitlab.com/api/v4/projects/20772874/repository/files/dinamo.json/raw?ref=master&private_token=1S_FpPnkbC5eyeWUmrYR"
    val okRequestList by lazy { Request.Builder().url(url).build() }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityDinamoVersionBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        title = "Dinamo"

        adapter = DinamoVersionListAdapter(this)
        binding.content.listView.adapter = adapter
        registerReceiver(onCompleteDownload, IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE))
        adapter.onDownload = { application ->

            val file = File(getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS), application.filename)
            val destinationUri = Uri.fromFile(file)

            if (file.exists() && file.canRead()) {

            } else {

                val urlRequest = Uri.parse(application.download_url)
                val request = DownloadManager.Request(urlRequest)
                    .setMimeType("application/vnd.android.package-archive")
                    .setTitle("Dinamo")
                    .setDescription("Downloading...")
                    .setNotificationVisibility(DownloadManager.Request.VISIBILITY_VISIBLE)
                    .setDestinationUri(destinationUri)
                    .setRequiresCharging(false)
                    .setAllowedOverMetered(true)
                    .setAllowedOverRoaming(true)

                val downloadManager = getSystemService(DOWNLOAD_SERVICE) as DownloadManager
                downloadManager.enqueue(request)
            }
        }
    }

    override fun onStart() {
        super.onStart()

        okClient.newCall(okRequestList).enqueue(object : Callback {
            override fun onFailure(call: Call, e: IOException) {
                e.printStackTrace()
                //Log.e("DONWLOAD_BINARY_error", "onFailure")
            }

            override fun onResponse(call: Call, response: Response) {
                runOnUiThread {
                    val jsonString = response.body()?.string()
                    val appInfo = Gson().fromJson(jsonString, DinamoInfo::class.java)
                    adapter.updateData(appInfo)
                    //Log.e("DONWLOAD_BINARY", appInfo.toString())
                }
            }
        })
    }


    override fun onDestroy() {
        super.onDestroy()
        unregisterReceiver(onCompleteDownload)
    }

    private val onCompleteDownload = object : BroadcastReceiver() {
        override fun onReceive(context: Context, intent: Intent) {

        }
    }

}