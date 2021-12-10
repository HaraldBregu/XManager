package it.ninespartans.xmanager.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*

open class TrainingProgram(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var title: String = "",
    var description: String = "",
    var programs: RealmList<Program> = RealmList(),
    var createdAt: Date? = Date(),
    var updatedAt: Date? = Date(),
    var startDate: Date? = null,
    var active: Boolean = false): RealmObject() {

    fun programBytesDevice(): ByteArray {
        var commandByteArray = byteArrayOf(0x7E)
        programs.forEach {
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
        programs.forEach {
            it.durationHoursByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

    fun durationMinutes():Int {
        var amount: Int = 0
        programs.forEach {
            it.durationMinutesByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

    fun durationSeconds():Int {
        var amount: Int = 0
        programs.forEach {
            it.durationSecondsByte?.let {
                amount += it.toInt()
            }
        }
        return amount
    }

}


