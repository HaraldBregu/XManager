package com.ninespartans.xmanager.adapters

import android.content.Context
import android.os.Environment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import com.google.android.material.button.MaterialButton
import com.ninespartans.xmanager.AppVersionActivity
import com.ninespartans.xmanager.BuildConfig
import com.ninespartans.xmanager.R
import com.ninespartans.xmanager.common.Version
import com.ninespartans.xmanager.model.AppInfo
import org.jetbrains.anko.runOnUiThread
import java.io.File
import java.time.LocalDate
import java.time.format.DateTimeFormatter

class AppVersionListAdapter(context: Context): BaseAdapter()  {
    private val mContext: Context
    private var inflater: LayoutInflater
    private var appInfo:AppInfo? = null
    private var apps: List<AppInfo.Application>? = null

    var onDownload: ((AppInfo.Application) -> Unit)? = null

    fun updateData(data: AppInfo) {
        this.appInfo = data

        this.apps = this.appInfo?.applications?.let {
            it.sortedByDescending {
                LocalDate.parse(
                    it.created_date,
                    DateTimeFormatter.ofPattern("dd-MM-yyyy"))
            }
        }

        notifyDataSetChanged()
    }

    init {
        mContext = context
        inflater = LayoutInflater.from(mContext)
    }

    override fun getCount(): Int {
        if (appInfo == null) { return 0 }
        val header = 1

        this.apps?.size?.let { return header + it }

        return header
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getItem(position: Int): AppInfo.Application? {
        val header = 1

        return this.apps?.get(position - header)
    }

    override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
        val isHeader = position==0

        if (isHeader) {
            val rowHeader = inflater.inflate(R.layout.row_app_device_header, viewGroup, false)

            val appName = rowHeader.findViewById<TextView>(R.id.appName)
            val nameApp = mContext.getText(mContext.applicationInfo.labelRes)
            appName.text = nameApp

            val appDescription = rowHeader.findViewById<TextView>(R.id.appDescription)
            appDescription.text = "Versione attuale: ${BuildConfig.VERSION_NAME} (${BuildConfig.VERSION_CODE})"

            return rowHeader
        }

        val app = this.apps?.get(position-1)

        val rowItem = inflater.inflate(R.layout.row_app_device_item, viewGroup, false)

        val appName = rowItem.findViewById<TextView>(R.id.appName)
        val lRes = mContext.applicationInfo.labelRes
        appName.text = mContext.getText(lRes)

        val appDescription = rowItem.findViewById<TextView>(R.id.appDescription)
        appDescription.text = "Versione: ${app?.version} (${app?.code})"

        val buttonDownload = rowItem.findViewById<MaterialButton>(R.id.download)
        buttonDownload.visibility = View.VISIBLE

        val appVersion = "${app?.version}${app?.code}"
        val currentAppVersion = "${BuildConfig.VERSION_NAME}${BuildConfig.VERSION_CODE}"
        if (appVersion == currentAppVersion) {
            buttonDownload.visibility = View.GONE
        }

        buttonDownload.setOnClickListener {
            onDownload?.let {
                app?.let { app ->
                    it(app)
                }
            }
        }

        buttonDownload.text = "Scarica"
        val extdir = mContext.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS)
        extdir?.listFiles()?.filter { it.canRead() &&  it.isFile && it.name==app?.filename }?.map {
            mContext.runOnUiThread {
                buttonDownload.text = "Installa"
            }
        }

        return rowItem
    }
}
