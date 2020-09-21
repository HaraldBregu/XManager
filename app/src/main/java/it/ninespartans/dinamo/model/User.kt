package it.ninespartans.dinamo.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*


open class User(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var createdAt: Date = Date(),
    var firstName: String = "",
    var lastName: String = "",
    var emailAddress: String = ""
    ):RealmObject()