package com.ninespartans.xmanager.model

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import org.bson.types.ObjectId
import java.util.*

open class User(
    @PrimaryKey
    var _id: ObjectId = ObjectId(),
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
