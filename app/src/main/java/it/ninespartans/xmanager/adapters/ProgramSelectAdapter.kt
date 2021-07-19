package it.ninespartans.xmanager.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import io.realm.RealmResults
import it.ninespartans.xmanager.R
import it.ninespartans.xmanager.model.TrainingSessionProgram
import kotlinx.android.synthetic.main.row_program_list.view.*
import kotlinx.android.synthetic.main.row_program_list.view.descriptionProgram
import kotlinx.android.synthetic.main.row_program_list.view.nameProgram
import kotlinx.android.synthetic.main.row_program_select_list.view.*

class ProgramSelectAdapter(context: Context, programs: RealmResults<TrainingSessionProgram>): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    var programs: RealmResults<TrainingSessionProgram>

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

    override fun getItem(position: Int): TrainingSessionProgram? {
        return programs.get(position)
    }

    override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
        val rowProgram = inflater.inflate(R.layout.row_program_select_list, viewGroup, false)

        val program = programs.get(position)

        //val sel = if (program?.active == true) "SELECTED" else "NOT SELECT"

        if (program?.active == true) {
            rowProgram.statusView.setBackgroundResource(R.color.primaryActionColor)
        } else {
            rowProgram.statusView.setBackgroundResource(R.color.primaryUnactiveColor)
        }

        rowProgram.nameProgram.text = program?.title //+ " " + sel
        rowProgram.descriptionProgram.text = "This is the description of the program"
        return rowProgram
    }
}