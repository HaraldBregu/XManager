package it.ninespartans.dinamo

import android.bluetooth.BluetoothDevice
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.BaseAdapter
import com.google.android.material.snackbar.Snackbar
import androidx.appcompat.app.AppCompatActivity
import io.realm.Realm
import io.realm.RealmResults
import it.ninespartans.dinamo.bluetooth.BLEManager
import it.ninespartans.dinamo.model.Player
import it.ninespartans.dinamo.model.TrainingProgram

import kotlinx.android.synthetic.main.activity_program_list.*
import kotlinx.android.synthetic.main.content_device_pair_search.*
import kotlinx.android.synthetic.main.row_device.view.*
import kotlinx.android.synthetic.main.row_program_list.view.*

class ProgramListActivity : AppCompatActivity() {
    private lateinit var adapter: ProgramAdapter

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_program_list)
        setSupportActionBar(toolbar)

        var realm = Realm.getDefaultInstance()
        val programs = realm.where(TrainingProgram::class.java).findAll()
        adapter = ProgramAdapter(this, programs)
        list_view.adapter = adapter
        list_view.setOnItemClickListener { parent, view, position, id ->
            val selectedProgram = programs.get(position)
            val intent = Intent(this, CreateProgramActivity::class.java)
            intent.putExtra("program_id", selectedProgram?.id)
            startActivity(intent)
        }

    }

    override fun onStart() {
        super.onStart()

        var realm = Realm.getDefaultInstance()
        val programs = realm.where(TrainingProgram::class.java).findAll()
        adapter.programs = programs
        adapter.notifyDataSetChanged()

    }

    /**
     * Adapter
     * ListView Adapter
     */
    private class ProgramAdapter(context: Context, programs: RealmResults<TrainingProgram>): BaseAdapter() {
        private var inflater: LayoutInflater
        var programs: RealmResults<TrainingProgram>

        init {
            inflater = LayoutInflater.from(context)
            this.programs = programs
        }

        override fun getCount(): Int {
            return programs.size
        }

        override fun getItemId(position: Int): Long {
            return position.toLong() //mItems.get(position).address.toLong()
        }

        override fun getItem(position: Int): TrainingProgram? {
            return programs.get(position)
        }

        override fun getView(position: Int, convertView : View?, viewGroup: ViewGroup?): View {
            val rowDevice = inflater.inflate(R.layout.row_program_list, viewGroup, false)

            rowDevice.nameProgram.text = programs.get(position)?.title
            rowDevice.descriptionProgram.text = programs.get(position)?.description

            return rowDevice
        }
    }
}
