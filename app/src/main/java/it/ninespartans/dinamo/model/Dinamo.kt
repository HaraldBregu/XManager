package it.ninespartans.dinamo.model

data class Dinamo(
    val name: String,
    val version: String,
    val macId: String,
    val chipId: String,
    val locked: String,
    val wifi: DinamoWifi
)