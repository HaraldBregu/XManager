package it.ninespartans.xmanager.common

import android.app.Dialog
import android.graphics.Color
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.LayerDrawable
import android.util.DisplayMetrics

object Common {

    fun setWhiteNavigationBar(dialog: Dialog) {
        val window = dialog.getWindow()
        if (window != null) {
            val metrics = DisplayMetrics()
            window!!.getWindowManager().getDefaultDisplay().getMetrics(metrics)

            val dimDrawable = GradientDrawable()

            val navigationBarDrawable = GradientDrawable()
            navigationBarDrawable.shape = GradientDrawable.RECTANGLE
            navigationBarDrawable.setColor(Color.WHITE)// Set color here

            val layers = arrayOf<Drawable>(dimDrawable, navigationBarDrawable)

            val windowBackground = LayerDrawable(layers)
            windowBackground.setLayerInsetTop(1, metrics.heightPixels)

            window!!.setBackgroundDrawable(windowBackground)
        }
    }
}