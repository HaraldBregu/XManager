package it.ninespartans.dinamo.model

import io.realm.RealmObject

open class Program(
    var title: String = "",
    var description: String = "",
    var durationTime: Int = 0
): RealmObject()

