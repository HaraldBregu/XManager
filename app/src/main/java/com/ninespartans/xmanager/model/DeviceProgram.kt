package com.ninespartans.xmanager.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import org.bson.types.ObjectId
import java.util.*

open class DeviceProgram(
    @PrimaryKey
    var _id: ObjectId = ObjectId(),
    var title: String = "",
    var description: String = "",
    var active: Boolean = false,
    var data: RealmList<ProgramData> = RealmList(),
    var creator:User? = null,
    var startDate: Date? = null,
    var createdAt: Date? = Date(),
    var updatedAt: Date? = Date()): RealmObject() {

    fun programBytesDevice(): ByteArray {
        var commandByteArray = byteArrayOf(0x7E)
        data.forEach {
            commandByteArray = commandByteArray.plus(
                byteArrayOf(
                    it.deviceLedPositionByte!!,           // LED position (0, 1, 2, 3, 4)
                    it.animationByte!!,                   // Animation (fixed, blink, fade)
                    it.durationHoursByte!!,               // Hours
                    it.durationMinutesByte!!,             // Minutes
                    it.durationSecondsByte!!))            // Seconds
        }
        return commandByteArray
    }
    /*
    fun programBytesLeftDevice(): ByteArray {
        var commandByteArray = byteArrayOf(0x7E)
        programList.forEach {
            commandByteArray = commandByteArray.plus(
                byteArrayOf(
                    it.leftDeviceLedPositionByte!!,       // LED position (0, 1, 2, 3, 4)
                    it.animationByte!!,                   // Animation (fixed, blink, fade)
                    it.durationHoursByte!!,               // Hours
                    it.durationMinutesByte!!,            // Minutes
                    it.durationSecondsByte!!))            // Seconds
        }
        return commandByteArray
    }

    fun programBytesRightDevice(): ByteArray {
        var commandByteArray = byteArrayOf(0x7E)
        programList.forEach {
            commandByteArray = commandByteArray.plus(
                byteArrayOf(
                    it.rightDeviceLedPositionByte!!,       // LED position (0, 1, 2, 3, 4)
                    it.animationByte!!,                   // Animation (fixed, blink, fade)
                    it.durationHoursByte!!,               // Hours
                    it.durationMinutesByte!!,            // Minutes
                    it.durationSecondsByte!!))            // Seconds

        }

        return commandByteArray
    }
*/
    fun durationHours():Int {
        var amount: Int = 0
        data.forEach {
            it.durationHoursByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

    fun durationMinutes():Int {
        var amount: Int = 0
        data.forEach {
            it.durationMinutesByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

    fun durationSeconds():Int {
        var amount: Int = 0
        data.forEach {
            it.durationSecondsByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

}


