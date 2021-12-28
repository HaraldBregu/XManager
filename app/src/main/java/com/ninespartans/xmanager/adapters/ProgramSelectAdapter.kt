package com.ninespartans.xmanager.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.LinearLayout
import android.widget.TextView
import io.realm.RealmResults
import com.ninespartans.xmanager.R
import com.ninespartans.xmanager.model.DeviceProgram


class ProgramSelectAdapter(context: Context, programs: RealmResults<DeviceProgram>): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    var programs: RealmResults<DeviceProgram>

    init {
        mContext = context
        inflater = LayoutInflater.from(context)
        this.programs = programs
    }

    override fun getCount(): Int {
        return programs.size
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getItem(position: Int): DeviceProgram? {
        return programs.get(position)
    }

    override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
        val rowProgram = inflater.inflate(R.layout.row_program_select_list, viewGroup, false)

        val nameProgram = rowProgram.findViewById<TextView>(R.id.nameProgram)
        val statusView = rowProgram.findViewById<LinearLayout>(R.id.statusView)

        val program = programs.get(position)
        nameProgram.text = program?.title

        if (program?.active == true) {
            statusView.setBackgroundResource(R.color.colorPrimaryVariant)
        } else {
            statusView.setBackgroundResource(R.color.colorPrimaryLight)
        }

        var totalSeconds = 0
        program?.durationHours()?.let { totalSeconds += it * 60 * 60 }
        program?.durationMinutes()?.let { totalSeconds += it * 60 }
        program?.durationSeconds()?.let { totalSeconds += it }

        var description = "Durata: "
        if (((totalSeconds/(60 * 60)) % 60) == 1) {
            description += "${((totalSeconds/(60 * 60)) % 60)} ora "
        }
        if (((totalSeconds/(60 * 60)) % 60) > 1) {
            description += "${((totalSeconds/(60 * 60)) % 60)} ore "
        }
        if (((totalSeconds/60) % 60) == 1) {
            description += "${((totalSeconds/60) % 60)} minuto "
        }
        if (((totalSeconds/60) % 60) > 1) {
            description += "${((totalSeconds/60) % 60)} minuti "
        }
        if ((totalSeconds % 60) == 1) {
            description += "${totalSeconds % 60} secondo"
        }
        if ((totalSeconds % 60) > 1) {
            description += "${totalSeconds % 60} secondi"
        }

        var sessions = ""
        program?.data?.let {
            sessions = "\nSessioni: ${it.size}"
        }
        description += sessions

        val descriptionProgram = rowProgram.findViewById<TextView>(R.id.descriptionProgram)
        descriptionProgram.text = description

        return rowProgram
    }
}