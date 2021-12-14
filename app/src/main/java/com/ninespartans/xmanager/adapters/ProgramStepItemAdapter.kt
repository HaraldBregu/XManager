package com.ninespartans.xmanager.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import io.realm.RealmResults
import com.ninespartans.xmanager.R
import com.ninespartans.xmanager.model.ProgramData
import kotlinx.android.synthetic.main.row_create_program_step.view.*
import kotlinx.android.synthetic.main.row_create_program_step_new.view.*


class ProgramStepItemAdapter(context: Context, programList: RealmResults<ProgramData>?): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    var programList: RealmResults<ProgramData>? = null

    var onDeleteStepItem: ((Int, ProgramData) -> Unit)? = null
    var onAddStepItem: (() -> Unit)? = null

    init {
        this.programList = programList

        mContext = context
        inflater = LayoutInflater.from(mContext)
    }

    override fun getCount(): Int {
        this.programList?.let {
            //val addItemCell = if (it.size > 3) 0 else 1
            return  it.size + 1 // addItemCell
        } ?: run {
            return 1
        }
    }

    override fun getItemId(position: Int): Long {
        return position.toLong()
    }

    override fun getItem(position: Int): ProgramData? {
        this.programList?.let {
            if (position == it.size)
                return null

            return it.get(position)
        } ?: run {
            return null
        }
    }

    override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
        this.programList?.let { programs ->
            if (position == programs.size) {
                val viewAddNewStep = inflater.inflate(R.layout.row_create_program_step_new, viewGroup, false)
                viewAddNewStep.addProgramStep.setOnClickListener {
                    onAddStepItem?.let {
                        it()
                    }
                }
                return viewAddNewStep
            }

            val program = programs.elementAt(position)
            val view = inflater.inflate(R.layout.row_create_program_step, viewGroup, false)

            val stepNumber = position + 1
            view.stepNumber.text = stepNumber.toString()

            var description = ""

            var minutesStr = ""
            program.durationMinutesByte?.let {
                if (it.toInt() == 1) {
                    minutesStr = "${it.toInt()} minuto "
                } else if (it > 1) {
                    minutesStr = "${it.toInt()} minuti "
                }
            }
            description += minutesStr

            var secondsStr = ""
            program.durationSecondsByte?.let {
                if (it.toInt() == 1) {
                    secondsStr = "${it} secondo "
                } else if (it.toInt() > 1) {
                    secondsStr = "${it} secondi "
                }
            }
            description += secondsStr
            view.descriptionProgram.text = description

            view.cancelProgramStep.setOnClickListener {
                onDeleteStepItem?.let {
                    it(stepNumber, program)
                }
            }

            return view

        } ?: run {
            val viewAddNewStep = inflater.inflate(R.layout.row_create_program_step_new, viewGroup, false)
            viewAddNewStep.addProgramStep.setOnClickListener {
                onAddStepItem?.let {
                    it()
                }
            }
            return viewAddNewStep
        }

    }

}