package it.ninespartans.xmanager.model

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*

open class TrainingProgram(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var title: String = "",
    var description: String = "",
    var durationTime: Int = 0,
    var startDate: Date = Date()
): RealmObject()