package it.ninespartans.dinamo.model

import io.realm.RealmObject
import java.util.*

open class Program(
    var title: String = "",
    var description: String = "",
    var durationTime: Int = 0,
    var startDate: Date = Date()
): RealmObject()

