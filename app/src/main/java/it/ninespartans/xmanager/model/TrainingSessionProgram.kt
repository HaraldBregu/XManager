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
): RealmObject()