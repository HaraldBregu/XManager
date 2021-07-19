package it.ninespartans.xmanager.model

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import io.realm.annotations.RealmClass
import java.util.*


//@RealmClass(embedded = true)
open class Device(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var name: String = "",
    var firmwareVersion: String = "",
    var mac: String = "",
    var ble_mac: String = "",
    var wifi_mac: String = ""
): RealmObject()
