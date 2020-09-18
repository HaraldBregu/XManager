package it.ninespartans.dinamo.model

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*


open class Device(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var name: String = "",
    var firmwareVersion: String = "",
    var mac: String = "",
    var bleMAC: String = "",
    var wifiMAC: String = ""
): RealmObject()