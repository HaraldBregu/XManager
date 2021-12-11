package com.ninespartans.xmanager.model

data class DeviceInfo(
    var name: String,
    var version: String,
    var locked: Boolean,
    var efuse_mac: String,
    var program_mode: String,
    var firmware_url: String,

    var ble: Ble,
    var wifi: WiFi
) {

    data class Ble(
        var connected: String,
        var mac: String)

    data class WiFi(
        val ssid: String,
        val password: String,
        var connected: String,
        var mac: String)
}