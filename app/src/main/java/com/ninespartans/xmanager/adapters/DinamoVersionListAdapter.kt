package com.ninespartans.xmanager.adapters

import android.content.Context
import android.os.Environment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.TextView
import com.google.android.material.button.MaterialButton
import com.ninespartans.xmanager.BuildConfig
import com.ninespartans.xmanager.R
import com.ninespartans.xmanager.model.AppInfo
import com.ninespartans.xmanager.model.DinamoInfo
import org.jetbrains.anko.runOnUiThread
import java.time.LocalDate
import java.time.format.DateTimeFormatter

class DinamoVersionListAdapter(context: Context): BaseAdapter()  {
    private val mContext: Context
    private var inflater: LayoutInflater
    private var dinamoInfo: DinamoInfo? = null
    private var firmares: List<DinamoInfo.Firmware>? = null

    var onDownload: ((DinamoInfo.Firmware) -> Unit)? = null

    fun updateData(data: DinamoInfo) {
        this.dinamoInfo = data

        this.firmares = this.dinamoInfo?.firmware?.let {
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
        if (dinamoInfo == null) { return 0 }
        val header = 1

        this.firmares?.size?.let { return header + it }

        return header
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getItem(position: Int): DinamoInfo.Firmware? {
        val header = 1

        return this.firmares?.get(position - header)
    }

    override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
        val isHeader = position==0

        if (isHeader) {
            val rowHeader = inflater.inflate(R.layout.row_dinamo_device_header, viewGroup, false)

            val appName = rowHeader.findViewById<TextView>(R.id.appName)
            appName.text = this.dinamoInfo?.name

            val appDescription = rowHeader.findViewById<TextView>(R.id.appDescription)
            appDescription.text = "Company: ${this.dinamoInfo?.company}"

            return rowHeader
        }

        val firmware = this.firmares?.get(position-1)

        val rowItem = inflater.inflate(R.layout.row_dinamo_device_item, viewGroup, false)

        val appName = rowItem.findViewById<TextView>(R.id.appName)
        appName.text = this.dinamoInfo?.name

        val appDescription = rowItem.findViewById<TextView>(R.id.appDescription)
        appDescription.text = "Versione: ${firmware?.version}"

        val buttonDownload = rowItem.findViewById<MaterialButton>(R.id.download)
        buttonDownload.visibility = View.VISIBLE
        buttonDownload.text = "Scarica"

        buttonDownload.setOnClickListener {
            onDownload?.let {
                firmware?.let { app ->
                    it(app)
                }
            }
        }

        val extdir = mContext.getExternalFilesDir(Environment.DIRECTORY_DOWNLOADS)
        extdir?.listFiles()?.filter { it.canRead() &&  it.isFile && it.name==firmware?.filename }?.map {
            mContext.runOnUiThread {
                buttonDownload.visibility = View.GONE
            }
        }

        return rowItem
    }
}
