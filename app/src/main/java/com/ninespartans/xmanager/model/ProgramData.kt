package com.ninespartans.xmanager.model

import io.realm.RealmObject
import io.realm.annotations.RealmClass


@RealmClass(embedded = true)
open class ProgramData: RealmObject() {

    enum class ShoeLedPosition { TOP, TOPEXT, EXT, TOPINT, INT }
    fun ledPositionToByte(position: ShoeLedPosition): Byte {
        when (position) {
            ShoeLedPosition.TOP ->
                return 0u.toByte()
            ShoeLedPosition.TOPEXT ->
                return 1u.toByte()
            ShoeLedPosition.EXT ->
                return 2u.toByte()
            ShoeLedPosition.TOPINT ->
                return 3u.toByte()
            ShoeLedPosition.INT ->
                return 4u.toByte()
        }

    }

    enum class ShoeLedAnimation { STATIC, BLINK, FADE }
    fun animationToByte(animation: ShoeLedAnimation): Byte {
        when (animation) {
            ShoeLedAnimation.STATIC ->
                return 0u.toByte()
            ShoeLedAnimation.BLINK ->
                return 1u.toByte()
            ShoeLedAnimation.FADE ->
                return 2u.toByte()
        }
    }

    //var leftDeviceLedPositionByte: Byte? = null
    //var rightDeviceLedPositionByte: Byte? = null
    var deviceLedPositionByte: Byte? = null
    var animationByte: Byte? = null
    var durationHoursByte: Byte? = null
    var durationMinutesByte: Byte? = null
    var durationSecondsByte: Byte? = null

    /**
     * Duration
     * Hours
     * Minutes
     * Seconds
     */

/*
    var durationHours: Long = 0
    var durationMinutes: Long = 0
    var durationSeconds: Long = 0


    enum class ShoeLedPosition(val value: Byte) {
        TOP(0u.toByte()),
        TOPEXT(1u.toByte()),
        BOTTOMEXT(2u.toByte()),
        TOPINT(3u.toByte()),
        BOTTOMINT(4u.toByte())
    }

    /**
     * Left device led position
     */
    private var leftDeviceLedPositionDescription: String = ShoeLedPosition.TOP.name
    var leftDeviceLedPosition: ShoeLedPosition
    get() { return ShoeLedPosition.valueOf(leftDeviceLedPositionDescription) }
    set(value) { leftDeviceLedPositionDescription = value.name }
    var leftDeviceLedPositionByte: Byte = leftDeviceLedPosition.value

    /**
     * Right device led position
     */
    private var rightDeviceLedPositionDescription: String = ShoeLedPosition.TOP.name
    var rightDeviceLedPosition: ShoeLedPosition
        get() { return ShoeLedPosition.valueOf(rightDeviceLedPositionDescription) }
        set(value) { rightDeviceLedPositionDescription = value.name }
    var rightDeviceLedPositionByte: Byte = rightDeviceLedPosition.value
*/

    fun setData(ledPosition: ShoeLedPosition, animation: ShoeLedAnimation, hours: Long, minutes: Long, seconds: Long) {
        //leftDeviceLedPositionByte = ledPositionToByte(leftLedPosition)
        //rightDeviceLedPositionByte = ledPositionToByte(rightLedPosition)
        deviceLedPositionByte = ledPositionToByte(ledPosition)
        animationByte = animationToByte(animation)
        durationHoursByte = hours.toByte()
        durationMinutesByte = minutes.toByte()
        durationSecondsByte = seconds.toByte()
    }


    /**
     * Device led animation
     * Device led animation byte
     */
    /* private var animationDescription: String = ShoeLedAnimation.STATIC.name
     var animation: ShoeLedAnimation
         get() {
             return ShoeLedAnimation.valueOf(animationDescription)
         }
         set(value) {
             animationDescription = value.name
         }

     var animation: ShoeLedAnimation
         get() { return ShoeLedAnimation.valueOf(animationDescription) }
         set(value) { animationDescription = value.name }

   */
    //var animationByte: Byte = animationToByte(animation)



}

