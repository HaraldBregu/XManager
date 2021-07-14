package it.ninespartans.xmanager.model

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*


open class Player(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var name: String = "",
    var role: String = "",
    var age: String = "",
    var leftDevice: Device? = null,
    var rightDevice: Device? = null,
    var sessionProgram: TrainingSessionProgram? = null,
    var active: Boolean = true
) : RealmObject()