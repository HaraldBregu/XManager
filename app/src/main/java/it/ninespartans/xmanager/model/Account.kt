package it.ninespartans.xmanager.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*

open class Account(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var emailAddress: String = "",
    var phoneNumber: String = "",
    var password: String = "",
    var createdAt: Date = Date(),
    var updatedAt: Date = Date()
    ):RealmObject()