package it.ninespartans.xmanager.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*

open class TrainingSessionProgram(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var title: String = "",
    var description: String = "",
    var programList:  RealmList<Program> = RealmList(),
    var startDate: Date? = null,
    var active: Boolean = false
): RealmObject() {

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

    fun durationHours():Int {
        var amount: Int = 0
        programList.forEach {
            it.durationHoursByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

    fun durationMinutes():Int {
        var amount: Int = 0
        programList.forEach {
            it.durationMinutesByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

    fun durationSeconds():Int {
        var amount: Int = 0
        programList.forEach {
            it.durationSecondsByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

}

