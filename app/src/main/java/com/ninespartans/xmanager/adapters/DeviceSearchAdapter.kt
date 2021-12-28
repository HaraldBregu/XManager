package com.ninespartans.xmanager.adapters

import android.bluetooth.BluetoothDevice
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView
import com.ninespartans.xmanager.R
import com.ninespartans.xmanager.model.Device
import io.realm.Case
import io.realm.Realm
import io.realm.kotlin.where
import androidx.recyclerview.widget.RecyclerView.ViewHolder





class DeviceSearchAdapter(context: Context): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    private val realm = Realm.getDefaultInstance()
    var items: ArrayList<BluetoothDevice> = ArrayList()

    init {
        mContext = context
        inflater = LayoutInflater.from(mContext)
    }

    override fun getCount(): Int {
        return items.size
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getItem(position: Int): Any {
        return items.get(position)
    }

    override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {

        val rowDevice = inflater.inflate(R.layout.row_device, viewGroup, false)

        val device = items.get(position)
        rowDevice.findViewById<TextView>(R.id.textViewDeviceName).text = device.name
        rowDevice.findViewById<TextView>(R.id.textViewMacAddress).text = "MAC: " + device.address
        rowDevice.findViewById<TextView>(R.id.textViewPlayer).visibility = View.GONE
        rowDevice.findViewById<ImageView>(R.id.leftShoeImage).setImageResource(R.drawable.left_unactive)
        rowDevice.findViewById<ImageView>(R.id.rightShoeImage).setImageResource(R.drawable.right_unactive)

        val realmDevice = realm.where<Device>()
        realmDevice.equalTo("ble_mac", device.address, Case.INSENSITIVE)
        realmDevice.isNotNull("user")
        realmDevice.findFirst()?.let {
            when (it.deviceType) {
                Device.DeviceType.SHOE_LEFT -> {
                    rowDevice.findViewById<TextView>(R.id.textViewPlayer).visibility = View.VISIBLE
                    rowDevice.findViewById<TextView>(R.id.textViewPlayer).text = it.user?.fullname
                    rowDevice.findViewById<ImageView>(R.id.leftShoeImage).setImageResource(R.drawable.left)
                }
                Device.DeviceType.SHOE_RIGHT -> {
                    rowDevice.findViewById<TextView>(R.id.textViewPlayer).visibility = View.VISIBLE
                    rowDevice.findViewById<TextView>(R.id.textViewPlayer).text =  it.user?.fullname
                    rowDevice.findViewById<ImageView>(R.id.rightShoeImage).setImageResource(R.drawable.right)
                }
                else -> {
                    rowDevice.findViewById<TextView>(R.id.textViewPlayer).visibility = View.GONE
                }
            }
        }



        return rowDevice
    }
}
