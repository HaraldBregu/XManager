package com.ninespartans.xmanager.model

data class AppInfo(
    var name: String,
    var description: String,
    var developer: String,
    var company: String,
    var applications: List<Application>) {

    data class Application(
        var version: String,
        var code: String,
        var description: String,
        var created_date: String,
        var filename: String,
        var download_url: String,
        var features: List<String>)

}