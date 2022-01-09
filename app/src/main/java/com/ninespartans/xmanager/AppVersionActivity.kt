package com.ninespartans.xmanager

import android.app.DownloadManager
import android.content.BroadcastReceiver
import android.content.Context
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.ninespartans.xmanager.adapters.AppVersionListAdapter
import com.ninespartans.xmanager.databinding.ActivityAppVersionBinding
import okhttp3.*
import java.io.IOException
import com.google.gson.Gson
import com.ninespartans.xmanager.model.AppInfo
import java.io.File
import android.content.Intent
import android.content.IntentFilter
import android.net.Uri
import android.os.Environment
import com.ninespartans.xmanager.common.MainApplication
import androidx.lifecycle.ViewModelProvider


class AppVersionActivity : AppCompatActivity() {
    private lateinit var binding: ActivityAppVersionBinding
    private lateinit var adapter: AppVersionListAdapter
    private lateinit var selectedApplication: AppInfo.Application
    private lateinit var mainApplication: MainApplication
    companion object {
        private lateinit var file: File
        private lateinit var destinationUri: Uri
    }

    val okClient by lazy { OkHttpClient() }
    val url = "https://gitlab.com/api/v4/projects/20772874/repository/files/xmanager.json/raw?ref=master&private_token=1S_FpPnkbC5eyeWUmrYR"
    val okRequestList by lazy { Request.Builder().url(url).build() }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAppVersionBinding.inflate(layoutInflater)
        setContentView(binding.root)
        setSupportActionBar(binding.toolbar)

        mainApplication = ViewModelProvider(this)[MainApplication::class.java]

        adapter = AppVersionListAdapter(this)
        binding.content.listView.adapter = adapter
        registerReceiver(onCompleteDownload, IntentFilter(DownloadManager.ACTION_DOWNLOAD_COMPLETE))
        adapter.onDownload = { application ->
            selectedApplication = application

            file = File(getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS), application.filename)
            destinationUri = Uri.fromFile(file)

            if (file.exists() && file.canRead()) {
                mainApplication.install(destinationUri)
            } else {

                val urlRequest = Uri.parse(application.download_url)
                val request = DownloadManager.Request(urlRequest)
                    .setMimeType("application/vnd.android.package-archive")
                    .setTitle("Xmanager")
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
                    val appInfo = Gson().fromJson(jsonString, AppInfo::class.java)
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
            mainApplication.install(destinationUri)
        }
    }
}

