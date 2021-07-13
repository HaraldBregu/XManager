package it.ninespartans.xmanager.model

import io.realm.RealmObject
import io.realm.annotations.RealmClass


enum class ShoeLedPosition {
    None,
    Top,
    TopExt,
    BottomExt,
    TopInt,
    BottomInt
}

enum class ShoeLedAnimation {
    None,
    Static,
    Blink
}

@RealmClass(embedded = true)
open class Program(
    //var leftLedPosition: ShoeLedPosition = ShoeLedPosition.None,
    //var rightLedPosition: ShoeLedPosition = ShoeLedPosition.None,
    //var animation: ShoeLedAnimation = ShoeLedAnimation.None,
    var duration: Long = 0
): RealmObject() {


}

