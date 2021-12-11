package com.ninespartans.xmanager.model

import io.realm.RealmObject
import io.realm.annotations.PrimaryKey
import org.bson.types.ObjectId
import java.util.*

open class Account(
    @PrimaryKey
    var _id: ObjectId = ObjectId(),
    var emailAddress: String = "",
    var phoneNumber: String = "",
    var password: String = "",
    var createdAt: Date = Date(),
    var updatedAt: Date = Date()
    ):RealmObject()