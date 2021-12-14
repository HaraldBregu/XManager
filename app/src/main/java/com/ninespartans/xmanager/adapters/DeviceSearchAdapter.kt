package com.ninespartans.xmanager.adapters

import android.bluetooth.BluetoothDevice
import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import com.ninespartans.xmanager.R
import com.ninespartans.xmanager.model.Device
import com.ninespartans.xmanager.model.User
import io.realm.Case
import io.realm.Realm
import io.realm.kotlin.where
import kotlinx.android.synthetic.main.row_device.view.*

class DeviceSearchAdapter(context: Context): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    var items: ArrayList<BluetoothDevice> = ArrayList()
    private val realm = Realm.getDefaultInstance()
    private var user: User? = null

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
        rowDevice.textViewDeviceName.text = device.name
        rowDevice.textViewMacAddress.text = "MAC: " + device.address
        rowDevice.textViewPlayer.visibility = View.GONE
        rowDevice.leftShoeImage?.setImageResource(R.drawable.left_unactive)
        rowDevice.rightShoeImage?.setImageResource(R.drawable.right_unactive)

        val realmDevice = realm.where<Device>()
        realmDevice.equalTo("ble_mac", device.address, Case.INSENSITIVE)
        realmDevice.isNotNull("user")
        realmDevice.findFirst()?.let {
            when (it.deviceType) {
                Device.DeviceType.SHOE_LEFT -> {
                    rowDevice.textViewPlayer.visibility = View.VISIBLE
                    rowDevice.textViewPlayer.text = it.user?.fullname
                    rowDevice.leftShoeImage?.setImageResource(R.drawable.left)
                }
                Device.DeviceType.SHOE_RIGHT -> {
                    rowDevice.textViewPlayer.visibility = View.VISIBLE
                    rowDevice.textViewPlayer.text =  it.user?.fullname
                    rowDevice.rightShoeImage?.setImageResource(R.drawable.right)
                }
                else -> {
                    rowDevice.textViewPlayer.visibility = View.GONE
                }
            }
        }



        return rowDevice
    }
}
