package it.ninespartans.xmanager.adapters

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import android.widget.PopupMenu
import io.realm.RealmResults
import it.ninespartans.xmanager.R
import it.ninespartans.xmanager.model.TrainingSessionProgram
import kotlinx.android.synthetic.main.row_program_list.view.*


class ProgramListAdapter(context: Context, programs: RealmResults<TrainingSessionProgram>): BaseAdapter() {
    private val mContext: Context
    private var inflater: LayoutInflater
    var programs: RealmResults<TrainingSessionProgram>

    enum class Action {
        UPDATE_PROGRAM,
        DELETE_PROGRAM
    }

    var onClickActionOnItem: ((Action, TrainingSessionProgram) -> Unit)? = null

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
        val rowProgram = inflater.inflate(R.layout.row_program_list, viewGroup, false)

        val program = programs.get(position)
        rowProgram.nameProgram.text = program?.title

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
        program?.programList?.let {
            sessions = "\nSessioni: ${it.size}"
        }
        description += sessions

        rowProgram.descriptionProgram.text = description

        /**
         * Options of the player
         */
        rowProgram.showProgramOptions.setOnClickListener {
            val popupMenu = PopupMenu(mContext, it)
            popupMenu.menuInflater.inflate(R.menu.popup_program_row_options, popupMenu.menu)
            popupMenu.menu.findItem(R.id.action_delete).setVisible(true)
            popupMenu.setOnMenuItemClickListener {
                when (it.itemId) {
                    R.id.action_delete ->
                        onClickActionOnItem?.let {
                            program?.let {
                                it(Action.DELETE_PROGRAM, it)
                            }
                        }
                    R.id.action_update -> {
                        onClickActionOnItem?.let {
                            program?.let {
                                it(Action.UPDATE_PROGRAM, it)
                            }
                        }
                    }
                }
                true
            }
            popupMenu.show()
        }

        return rowProgram
    }
}