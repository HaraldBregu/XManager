package it.ninespartans.xmanager.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import io.realm.annotations.RealmClass
import java.util.*

open class Device(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var user: User? = null,
    var name: String = "",
    var firmwareVersion: String = "",
    var mac: String = "",
    var ble_mac: String = "",
    var wifi_mac: String = "",
    var programs: RealmList<Program> = RealmList(),
    var createdAt: Date = Date(),
    var updatedAt: Date = Date()
): RealmObject()
