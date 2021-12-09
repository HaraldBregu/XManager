package it.ninespartans.xmanager

import android.app.Dialog
import android.graphics.Color
import android.os.Bundle
import android.util.Log
import android.view.KeyEvent
import android.view.View
import android.view.inputmethod.InputMethodManager
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.google.android.material.bottomsheet.BottomSheetDialog
import io.realm.Realm
import io.realm.kotlin.where
import it.ninespartans.xmanager.adapters.ProgramStepItemAdapter
import it.ninespartans.xmanager.model.TrainingSessionProgram
import kotlinx.android.synthetic.main.activity_create_program.*
import kotlinx.android.synthetic.main.content_create_program.*
import kotlinx.android.synthetic.main.content_create_program.list_view
import com.google.android.material.button.MaterialButton
import io.realm.RealmList
import it.ninespartans.xmanager.model.Program
import kotlinx.android.synthetic.main.content_create_program.nameInputText
import org.bson.types.ObjectId
import java.util.*
import android.graphics.drawable.LayerDrawable
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.util.DisplayMetrics
import androidx.annotation.NonNull
import android.os.Build
import android.widget.RadioButton
import androidx.annotation.RequiresApi
import com.google.android.material.bottomsheet.BottomSheetBehavior
import com.google.android.material.slider.Slider
import it.ninespartans.xmanager.common.Common


class CreateProgramActivity : AppCompatActivity() {
    private lateinit var adapter: ProgramStepItemAdapter
    private var trainingSessionProgram: TrainingSessionProgram? = null
    private var programId: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_create_program)
        setSupportActionBar(toolbar)

        intent.getStringExtra("program_id")?.let {
            programId = it
        }

        title = getString(R.string.title_activity_create_program_nav_title)
        header_title.text = getString(R.string.title_activity_create_program_header_title)
        header_description.text = getString(R.string.title_activity_create_program_header_description)
        saveProgram.text = getString(R.string.title_activity_create_program_button_create)

        createSession.visibility = View.GONE

        programId?.let {
            header_title.text = getString(R.string.title_activity_update_program_header_title)
            header_description.text = getString(R.string.title_activity_update_program_header_description)
            saveProgram.text = getString(R.string.activity_create_program_button_save)

            Realm.getDefaultInstance().use { realm ->
                realm.where<TrainingSessionProgram>().equalTo("id", it).findFirst()?.let {
                    this.trainingSessionProgram = it
                    this.nameInputText.editText?.setText(it.title)

                    if (it.programList.size > 3) {
                        createSession.visibility = View.VISIBLE
                    }
                }
            }
        }

        /**
         * On saving the program
         * Check if programId has a value
         */
        saveProgram.setOnClickListener {
            Realm.getDefaultInstance().use { realm ->

                /**
                 * Check if trainingSessionProgram exists
                 */
                trainingSessionProgram?.let {

                    /**
                     * Update TrainingSessionProgram
                     * save title from the textfield
                     * close the page
                     */
                    realm.executeTransaction { realm ->
                        realm.copyToRealmOrUpdate(it.apply {
                            title = nameInputText.editText?.text.toString()
                            finish()
                        })
                    }
                } ?: run {

                    /**
                     * Create new TrainingSessionProgram
                     * save title from the textfield
                     * close the page
                     */
                    realm.executeTransaction {
                        trainingSessionProgram = it.copyToRealmOrUpdate(TrainingSessionProgram().apply {
                            title = nameInputText.editText?.text.toString()
                            finish()
                        })
                    }
                }
            }
        }

        /**
         * Adapter program step
         */
        adapter = ProgramStepItemAdapter(this, trainingSessionProgram?.programList?.where()?.findAll())
        list_view.adapter = adapter


        adapter.onAddStepItem = {
            addSessionProgram()
        }

        createSession.setOnClickListener {
            addSessionProgram()
        }

        adapter.onDeleteStepItem = { stepNumber, item ->
            Realm.getDefaultInstance().use { realm ->
                trainingSessionProgram?.let {
                    realm.executeTransaction { realm ->
                        realm.copyToRealmOrUpdate(it.apply {
                            this.programList.remove(item)
                            updateList()
                        })
                    }
                }
            }
        }
    }

    fun addSessionProgram() {
        val bottomSheetDialog = BottomSheetDialog(this)
        bottomSheetDialog.setContentView(R.layout.content_program_create_session_bottom_sheet)
        bottomSheetDialog.behavior.isDraggable = false
        bottomSheetDialog.behavior.state = BottomSheetBehavior.STATE_EXPANDED
        bottomSheetDialog.show()
        Common.setWhiteNavigationBar(bottomSheetDialog)

        val radioButton = bottomSheetDialog.findViewById<RadioButton>(R.id.radio_button_3)
        radioButton?.isEnabled = false

        val durationDescription = bottomSheetDialog.findViewById<TextView>(R.id.durationDescription)

        /**
         * Slider
         */
        val slider = bottomSheetDialog.findViewById<Slider>(R.id.durationSlider)
        durationDescription?.text = slider?.value?.toInt()?.let { updateTimerByValueSlider(it) }

        slider?.addOnSliderTouchListener(object : Slider.OnSliderTouchListener {
            override fun onStartTrackingTouch(slider: Slider) {
                durationDescription?.text = updateTimerByValueSlider(slider.value.toInt())
            }
            override fun onStopTrackingTouch(slider: Slider) {
                durationDescription?.text = updateTimerByValueSlider(slider.value.toInt())
            }
        })
        slider?.addOnChangeListener { slider, value, fromUser ->
            durationDescription?.text = updateTimerByValueSlider(slider.value.toInt())
        }


        val saveButton = bottomSheetDialog.findViewById<MaterialButton>(R.id.saveButton)
        saveButton?.setOnClickListener {

            val program = Program()
            program.setData(
                Program.ShoeLedPosition.TOP,
                Program.ShoeLedPosition.TOP,
                Program.ShoeLedAnimation.BLINK,
                hoursBySliderValue(slider?.value),
                minutesBySliderValue(slider?.value),
                secondsBySliderValue(slider?.value))

            Realm.getDefaultInstance().use { realm ->

                /**
                 * Check if TrainingSessionProgram exists
                 */
                trainingSessionProgram?.let { trainingSessionProgram ->

                    /**
                     * Update TrainingSessionProgram
                     * save programs
                     * save title
                     */
                    realm.executeTransaction { realm ->
                        realm.copyToRealmOrUpdate(trainingSessionProgram.apply {
                            this.title = nameInputText.editText?.text.toString()
                            this.programList.add(program)
                            bottomSheetDialog.hide()
                            updateList()
                        })
                    }
                } ?: run {

                    /**
                     * If TrainingSessionProgram doesn't exists
                     * create new
                     * add programs
                     * valorise programId
                     */
                    realm.executeTransaction {
                        trainingSessionProgram = it.copyToRealmOrUpdate(TrainingSessionProgram().apply {
                            this.title = nameInputText.editText?.text.toString()
                            this.programList.add(program)
                        })

                        bottomSheetDialog.hide()
                        updateList()
                    }
                }
            }

        }
    }

    fun updateList() {
        trainingSessionProgram?.let {
            adapter.programList = it.programList.where()?.findAll()
            createSession.visibility = View.GONE
            if (it.programList.size > 5) {
                createSession.visibility = View.VISIBLE
            }
            adapter.notifyDataSetChanged()
        }
    }

    fun updateTimerByValueSlider(value: Int): String {
        /*
        var hoursStr = "00"
        var minutesStr = "00"
        var secondsStr = "00"

        val one_minute = 60

        when (value) {
            in 0..9 -> {
                secondsStr = "0$value"
            }
            in 10..59 -> {
                secondsStr = "$value"
            }
            one_minute -> {
                minutesStr = "0${1}"
            }
            in one_minute+1..one_minute+8 -> {
                minutesStr = "0${(value - one_minute + 1)}"
            }
            in one_minute+9..one_minute+58 -> {
                minutesStr = "${(value - one_minute + 1)}"
            }
            one_minute+59 -> {
                hoursStr = "0${1}"
            }
            one_minute+60 -> {
                hoursStr = "0${2}"
            }
        }

        return "$hoursStr:$minutesStr:$secondsStr"
        */

        val one_minute = 60

        when (value) {
            0 -> {
                return "$value secondi"
            }
            1 -> {
                return "$value secondo"
            }
            in 2..59 -> {
                return "$value secondi"
            }
            one_minute -> {
                return "1 minuto"
            }
            in one_minute+1..one_minute+58 -> {
                return "${(value - one_minute + 1)} minuti"
            }
            one_minute+59 -> {
                return "1 ora"
            }
            one_minute+60 -> {
                return "2 ore"
            }
        }

        return  ""
    }

    fun hoursBySliderValue(value: Float?): Long {
        value?.let {
            val value = it.toInt()
            if (value >= 120)
                return 1
        }
        return 0
    }

    fun minutesBySliderValue(value: Float?): Long {
        value?.let {
            val value = it.toInt()
            if (value >= 60 && value < 120) {
                var min = (value - 60) + 1
                if (min == 60) min = 0
                return min.toLong()
            }
        }
        return 0
    }

    fun secondsBySliderValue(value: Float?): Long {
        value?.let {
            val value = it.toInt()
            if (value > 0 && value < 60)
                return value.toLong()
        }
        return 0
    }

}
