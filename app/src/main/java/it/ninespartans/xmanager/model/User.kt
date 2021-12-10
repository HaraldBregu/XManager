package it.ninespartans.xmanager.model

import io.realm.RealmList
import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import java.util.*

open class User(
    @PrimaryKey
    var id: String = UUID.randomUUID().toString(),
    var account: Account? = null,
    var fullname: String = "",
    var headline: String = "",
    var role: String = "",
    var age: String = "",
    var emailAddress: String = "",
    var phoneNumber: String = "",
    var createdAt: Date = Date(),
    var updatedAt: Date = Date()
) : RealmObject()
