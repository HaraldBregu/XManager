package it.ninespartans.dinamo

import android.app.Application
import android.util.Log
import io.realm.Realm
import io.realm.RealmConfiguration

class DinamoApplication: Application() {

    override fun onCreate() {
        super.onCreate()

        Realm.init(this)
        val configuration = RealmConfiguration.Builder()
            .name("Dinamo.realm")
            .deleteRealmIfMigrationNeeded()
            .schemaVersion(0)
            .build()
        Realm.setDefaultConfiguration(configuration)

        //val d = configuration.realmDirectory
        //Log.i("DINAMO_REALM_URL", d)
    }
}