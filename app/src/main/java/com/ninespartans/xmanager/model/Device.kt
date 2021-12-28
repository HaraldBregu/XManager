package com.ninespartans.xmanager.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import org.bson.types.ObjectId
import java.util.*

open class Device(
    @PrimaryKey
    var _id: ObjectId = ObjectId(),
    var name: String = "",
    var version: String = "",
    var type: String = DeviceType.NONE.name,
    var active: Boolean = true,

    var mac: String = "",
    var ble_mac: String = "",
    var wifi_mac: String = "",

    var program: DeviceProgram? = null,
    var user: User? = null,

    var createdAt: Date = Date(),
    var updatedAt: Date = Date()
    ): RealmObject() {

    /** Type of device */
    enum class DeviceType { NONE, SHOE_LEFT, SHOE_RIGHT }
    var deviceType: DeviceType
        get() { return DeviceType.valueOf(type) }
        set(newEnumType) { type = newEnumType.name }

}
