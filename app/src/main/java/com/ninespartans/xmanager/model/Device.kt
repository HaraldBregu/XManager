package com.ninespartans.xmanager.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import org.bson.types.ObjectId
import java.util.*

open class Device(
    @PrimaryKey
    var _id: ObjectId = ObjectId(),
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
