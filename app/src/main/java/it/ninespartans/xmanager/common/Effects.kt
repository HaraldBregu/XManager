package it.ninespartans.xmanager.common

import android.content.Context
import android.os.Vibrator

object Effects {
    lateinit var vibrator: Vibrator

    fun vibrate(context: Context) {
        vibrator = context.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
        //v.vibrate(VibrationEffect.createOneShot(50, VibrationEffect.DEFAULT_AMPLITUDE))

        //val doubleClickPattern = longArrayOf(0, 75, 75, 75)
        //v.vibrate(VibrationEffect.createWaveform(doubleClickPattern, VibrationEffect.EFFECT_CLICK))
        //v.cancel()

        //val doubleClickPattern = longArrayOf(0, 75, 75, 75)
        //v.vibrate(VibrationEffect.createWaveform(doubleClickPattern, VibrationEffect.EFFECT_DOUBLE_CLICK))

        //v.vibrate(VibrationEffect.createOneShot(500, VibrationEffect.EFFECT_HEAVY_CLICK))

        //v.vibrate(VibrationEffect.createOneShot(50, VibrationEffect.EFFECT_TICK))



    }
}