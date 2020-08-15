package it.ninespartans.dinamo.model

import android.app.Application
import android.bluetooth.BluetoothAdapter
import android.content.SharedPreferences
import androidx.preference.PreferenceManager
import android.bluetooth.BluetoothSocket
import android.bluetooth.le.BluetoothLeScanner
import android.content.Intent


class User() {
    val name: String? = null
    var leftShoe: DinamoDevice? = null
    var rightShoe: DinamoDevice? = null

    init {

    }

    //private val PREFERENCE_FILE_KEY = "private.user.data"

    fun update() {
        //PreferenceManager.getDefaultSharedPreferences(this)
        //val sharedPref : SharedPreferences = applicationContext.getSharedPreferences(PREFERENCE_FILE_KEY, MODE_PRIVATE)

    }
}


/*
class BluetoothManager private constructor() {

    private object HOLDER {
        val INSTANCE = BluetoothManager()
    }

    companion object {
        val instance: BluetoothManager by lazy { HOLDER.INSTANCE }
    }

    init {

    }
}
*/
/*
class MyApplication : Application() {

    var currentBluetoothConnection: BluetoothSocket? = null
        internal set

    override fun onCreate() {
        super.onCreate()

        application = this
    }

    fun setupBluetoothConnection() {
        // Either setup your connection here, or pass it in
    }

    companion object {

        var application: MyApplication? = null
            private set
    }
}
*/

/*
// Singleton
object wefwe {

}

class Person {
    var name = "Anne"
    var age = 32
}

enum class ContentKind {
    TOPIC,
    ARTICLE,
    EXERCISE,
    VIDEO,
}

enum class ContentKind3(val kind: String) {
    TOPIC("Topic"),
    ARTICLE("Article"),
    EXERCISE("Exercise"),
    VIDEO("Video"),
    ;

    override fun toString(): String {
        return kind
    }
}*/