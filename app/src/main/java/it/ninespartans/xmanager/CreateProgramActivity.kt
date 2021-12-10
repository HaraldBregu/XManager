package it.ninespartans.xmanager

import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.animation.Animation
import android.view.animation.AnimationUtils
import android.widget.*
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
import it.ninespartans.xmanager.model.Program
import kotlinx.android.synthetic.main.content_create_program.nameInputText
import com.google.android.material.bottomsheet.BottomSheetBehavior
import com.google.android.material.button.MaterialButtonToggleGroup
import com.google.android.material.slider.Slider
import it.ninespartans.xmanager.common.Common


class CreateProgramActivity : AppCompatActivity() {
    private lateinit var adapter: ProgramStepItemAdapter
    private var trainingSessionProgram: TrainingSessionProgram? = null
    private var programId: String? = null
    private var checkedRadioButtonAnimationId:Int? = null
    private var checkedButtonDirectionId:Int? = null
    private var currentLightAnimationType:String = ""
    private var currentLightDirectionType:String = ""
    private var currentLightDirectionResource:Int = R.drawable.shoe_pair_light_top
    private var shoePairImageView: ImageView? = null
    private var saveButton: MaterialButton? = null

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

        /** Image View Container */
        shoePairImageView = bottomSheetDialog.findViewById(R.id.shoePairImageView)
        var animationBlink = AnimationUtils.loadAnimation(this, R.anim.fade_in)
        var lightPositionTitle = bottomSheetDialog.findViewById<TextView>(R.id.lightPositionTitle)

        /** Indicator Light RadioGroup */
        val radioGroupIndicator = bottomSheetDialog.findViewById<RadioGroup>(R.id.radioGroupIndicator)
        checkedRadioButtonAnimationId = radioGroupIndicator?.checkedRadioButtonId // Returns View.NO_ID if nothing is checked.
        var radioButtonAnimation = checkedRadioButtonAnimationId?.let { bottomSheetDialog.findViewById<RadioButton>(it) }
        currentLightAnimationType = radioButtonAnimation?.text.toString()

        /** Direction Light ToggleGroup */
        val toggleButtonGroupDirection = bottomSheetDialog.findViewById<MaterialButtonToggleGroup>(R.id.toggleButtonDirection)
        checkedButtonDirectionId = toggleButtonGroupDirection?.checkedButtonId
        var toggleButtonDirection = checkedButtonDirectionId?.let { bottomSheetDialog.findViewById<Button>(it) }
        currentLightDirectionType = toggleButtonDirection?.text.toString()

        /** Start with default values */
        if (!currentLightAnimationType.isEmpty() && !currentLightDirectionType.isEmpty()) {
            currentLightDirectionResource = updateCurrentLightDirectionResource(currentLightDirectionType)
            lightPositionTitle?.text = updateTitleDirection(currentLightDirectionType)
            shoePairImageView?.setBackgroundResource(currentLightDirectionResource)
            shoePairImageView?.clearAnimation()
            updateShoeAnimation(currentLightAnimationType, animationBlink)
        }

        radioGroupIndicator?.setOnCheckedChangeListener { group, checkedId ->
            checkedRadioButtonAnimationId = checkedId
            radioButtonAnimation = checkedRadioButtonAnimationId?.let { bottomSheetDialog.findViewById(it) }
            currentLightAnimationType = radioButtonAnimation?.text.toString()
            shoePairImageView?.clearAnimation()
            updateShoeAnimation(currentLightAnimationType, animationBlink)
        }

        toggleButtonGroupDirection?.addOnButtonCheckedListener { group, checkedId, isChecked ->
            checkedButtonDirectionId = checkedId
            toggleButtonDirection = checkedButtonDirectionId?.let { bottomSheetDialog.findViewById(it) }
            currentLightDirectionType = toggleButtonDirection?.text.toString()
            currentLightDirectionResource = updateCurrentLightDirectionResource(currentLightDirectionType)
            lightPositionTitle?.text = updateTitleDirection(currentLightDirectionType)
            shoePairImageView?.clearAnimation()
            updateShoeAnimation(currentLightAnimationType, animationBlink)
        }

        /** Image Animation */
        val durationDescription = bottomSheetDialog.findViewById<TextView>(R.id.durationDescription)

        /** Slider */
        val slider = bottomSheetDialog.findViewById<Slider>(R.id.durationSlider)
        var sliderValue = 0
        slider?.value?.toInt()?.let { sliderValue = it }
        durationDescription?.text = sliderValue.let { updateTimerByValueSlider(it) }
        slider?.addOnSliderTouchListener(object : Slider.OnSliderTouchListener {
            override fun onStartTrackingTouch(slider: Slider) {
                durationDescription?.text = updateTimerByValueSlider(slider.value.toInt())
            }
            override fun onStopTrackingTouch(slider: Slider) {
                durationDescription?.text = updateTimerByValueSlider(slider.value.toInt())
            }
        })
        slider?.addOnChangeListener { slider, value, fromUser ->
            saveButton?.isEnabled = (!currentLightAnimationType.isEmpty() && !currentLightDirectionType.isEmpty() && (value > 0.0))
            durationDescription?.text = updateTimerByValueSlider(slider.value.toInt())
        }

        /** Save Button */
        saveButton = bottomSheetDialog.findViewById<MaterialButton>(R.id.saveButton)
        saveButton?.setOnClickListener {
            val program = Program()
            program.setData(
                programLedPosition(currentLightDirectionType),
                programLedAnimation(currentLightAnimationType),
                hoursBySliderValue(slider?.value),
                minutesBySliderValue(slider?.value),
                secondsBySliderValue(slider?.value))

            /** Save training session with programs */
            Realm.getDefaultInstance().use { realm ->
                trainingSessionProgram?.let { trainingSessionProgram ->
                    realm.executeTransaction { realm ->
                        realm.copyToRealmOrUpdate(trainingSessionProgram.apply {
                            this.title = nameInputText.editText?.text.toString()
                            this.programList.add(program)
                            bottomSheetDialog.hide()
                            updateList()
                        })
                    }
                } ?: run {
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

    fun programLedPosition(value: String):Program.ShoeLedPosition {
        when(value) {
            getString(R.string.sheet_create_session_dir_ext) -> {
                return Program.ShoeLedPosition.EXT
            }
            getString(R.string.sheet_create_session_dir_top_ext) -> {
                return Program.ShoeLedPosition.TOPEXT
            }
            getString(R.string.sheet_create_session_dir_top) -> {
                return Program.ShoeLedPosition.TOP
            }
            getString(R.string.sheet_create_session_dir_top_int) -> {
                return Program.ShoeLedPosition.TOPINT
            }
            getString(R.string.sheet_create_session_dir_int) -> {
                return Program.ShoeLedPosition.INT
            }
            else -> {
                return Program.ShoeLedPosition.TOP
            }
        }
    }

    fun programLedAnimation(value: String):Program.ShoeLedAnimation {
        when (value) {
            getString(R.string.sheet_create_session_type_static) -> {
                return Program.ShoeLedAnimation.STATIC
            }
            getString(R.string.sheet_create_session_type_blink) -> {
                return Program.ShoeLedAnimation.BLINK
            }
            getString(R.string.sheet_create_session_type_fade) -> {
                return Program.ShoeLedAnimation.FADE
            }
            else -> {
                return Program.ShoeLedAnimation.BLINK
            }
        }
    }

    fun updateShoeAnimation(type: String, animation: Animation) {

        when (type) {
            getString(R.string.sheet_create_session_type_static) -> {
                shoePairImageView?.setBackgroundResource(currentLightDirectionResource)
            }
            getString(R.string.sheet_create_session_type_blink) -> {
                shoePairImageView?.setBackgroundResource(currentLightDirectionResource)
                shoePairImageView?.startAnimation(animation)
            }
            getString(R.string.sheet_create_session_type_fade) -> {
                shoePairImageView?.setBackgroundResource(currentLightDirectionResource)
                shoePairImageView?.startAnimation(animation)
            }
        }
    }

    fun updateCurrentLightDirectionResource(value: String): Int {
        when(value) {
            getString(R.string.sheet_create_session_dir_ext) -> {
                return R.drawable.shoe_pair_light_ext
            }
            getString(R.string.sheet_create_session_dir_top_ext) -> {
                return R.drawable.shoe_pair_light_top_ext
            }
            getString(R.string.sheet_create_session_dir_top) -> {
                return R.drawable.shoe_pair_light_top
            }
            getString(R.string.sheet_create_session_dir_top_int) -> {
                return R.drawable.shoe_pair_light_top_int
            }
            getString(R.string.sheet_create_session_dir_int) -> {
                return R.drawable.shoe_pair_light_int
            }
            else -> {
                return R.drawable.shoe_pair_light_top
            }
        }
    }

    fun updateTitleDirection(value: String): String {
        when(value) {
            getString(R.string.sheet_create_session_dir_ext) -> {
                return getString(R.string.sheet_create_session_dir_foot_ext_title)
            }
            getString(R.string.sheet_create_session_dir_top_ext) -> {
                return getString(R.string.sheet_create_session_dir_col_ext_title)
            }
            getString(R.string.sheet_create_session_dir_top) -> {
                return getString(R.string.sheet_create_session_dir_col_title)
            }
            getString(R.string.sheet_create_session_dir_top_int) -> {
                return getString(R.string.sheet_create_session_dir_col_int_title)
            }
            getString(R.string.sheet_create_session_dir_int) -> {
                return getString(R.string.sheet_create_session_dir_foot_int_title)
            }
            else -> {
                return getString(R.string.sheet_create_session_dir_col_title)
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
            else -> {
                return  ""
            }
        }
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
