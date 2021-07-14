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
import androidx.annotation.RequiresApi


class CreateProgramActivity : AppCompatActivity() {
    private lateinit var adapter: ProgramStepItemAdapter
    private var trainingSessionProgram: TrainingSessionProgram? = null
    private var programId: String? = null

    @RequiresApi(Build.VERSION_CODES.M)
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
        saveProgram.text = getString(R.string.title_program_create)

        createSession.visibility = View.GONE

        programId?.let {
            header_title.text = getString(R.string.title_activity_update_program_header_title)
            header_description.text = getString(R.string.title_activity_update_program_header_description)
            saveProgram.text = getString(R.string.title_program_save)

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

    @RequiresApi(Build.VERSION_CODES.M)
    fun addSessionProgram() {
        val bottomSheetDialog = BottomSheetDialog(this)
        bottomSheetDialog.setContentView(R.layout.content_program_create_session_bottom_sheet)
        bottomSheetDialog.behavior.isDraggable = false
        bottomSheetDialog
        val title = bottomSheetDialog.findViewById<TextView>(R.id.title)
        title?.text = "Create a session"

        val description = bottomSheetDialog.findViewById<TextView>(R.id.description)
        description?.text = "Select the parts of the shoes you want to use, animation type and the duration of the session."
        bottomSheetDialog.show()
        setWhiteNavigationBar(bottomSheetDialog)

        val saveButton = bottomSheetDialog.findViewById<MaterialButton>(R.id.saveButton)
        saveButton?.setOnClickListener {

            val program = Program()
            program.duration = 1000

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

    @RequiresApi(api = Build.VERSION_CODES.M)
    private fun setWhiteNavigationBar(dialog: Dialog) {
        val window = dialog.getWindow()
        if (window != null) {
            val metrics = DisplayMetrics()
            window!!.getWindowManager().getDefaultDisplay().getMetrics(metrics)

            val dimDrawable = GradientDrawable()

            val navigationBarDrawable = GradientDrawable()
            navigationBarDrawable.shape = GradientDrawable.RECTANGLE
            navigationBarDrawable.setColor(Color.WHITE)// Set color here

            val layers = arrayOf<Drawable>(dimDrawable, navigationBarDrawable)

            val windowBackground = LayerDrawable(layers)
            windowBackground.setLayerInsetTop(1, metrics.heightPixels)

            window!!.setBackgroundDrawable(windowBackground)
        }
    }

}
