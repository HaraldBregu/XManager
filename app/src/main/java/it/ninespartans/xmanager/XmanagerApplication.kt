package it.ninespartans.xmanager

import android.app.Application
import android.util.Log
import io.realm.Realm
import io.realm.RealmConfiguration

class XmanagerApplication: Application() {

    override fun onCreate() {
        super.onCreate()

        Realm.init(this)
        val configuration = RealmConfiguration.Builder()
            .deleteRealmIfMigrationNeeded()
            .allowWritesOnUiThread(true)
            .name("xmanager.realm")
            .schemaVersion(0)
            .build()

        Realm.setDefaultConfiguration(configuration)

        //val d = configuration.realmDirectory
        //Log.i("XMANAGER_REALM_URL", d)
    }
}