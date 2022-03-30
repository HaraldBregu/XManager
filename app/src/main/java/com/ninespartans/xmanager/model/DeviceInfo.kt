package com.ninespartans.xmanager.model

data class DeviceInfo(
    var name: String,
    var version: String,
    var locked: Boolean,
    var efuse_mac: String,

    var ble: Ble
) {

    data class Ble(
        var connected: String,
        var mac: String)

}