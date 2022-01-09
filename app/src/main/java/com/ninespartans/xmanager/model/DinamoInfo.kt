package com.ninespartans.xmanager.model



data class DinamoInfo(
    var name: String,
    var description: String,
    var developer: String,
    var company: String,
    var firmware: List<Firmware>) {

    data class Firmware(
        var version: String,
        var description: String,
        var created_date: String,
        var filename: String,
        var download_url: String,
        var features: List<String>)
}