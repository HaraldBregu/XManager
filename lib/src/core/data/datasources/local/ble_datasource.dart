import 'dart:async';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

abstract class BleDataSource {
  Future<void> startScan(int seconds, List<String>? services);
  Future<void> stopScan();
  Stream<List<ScanResult>> get scanResults;
  Stream<bool> get isScanning;
  Future<bool> get isSupported;
  Future<void> turnOn();
  Future<List<BluetoothService>> connect(String uuid);
  Future<void> disconnect(String uuid);
  Stream<bool> connected(String uuid);
  Future<bool> isConnected(String uuid);

  Future<List<int>?> readCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    // bool notify,
  );

  Future<void> writeCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    List<int> value,
    //  bool notify,
  );
}

class BleDataSourceImpl implements BleDataSource {
  BleDataSourceImpl();

  @override
  Future<void> startScan(int seconds, List<String>? services) async {
    if (FlutterBluePlus.isScanningNow) return;

    //final guidServices = services!.map((e) => Guid(e)).toList();

    await FlutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
      //scanMode: ScanMode.lowLatency,
      //withServices: [Guid("00001600-1212-efde-1523-785feabcd121")],
      //withServices: guidServices,
      //macAddresses: const [],
      //allowDuplicates: false,
      //androidUsesFineLocation: false,
    );
  }

  @override
  Future stopScan() async {
    if (!FlutterBluePlus.isScanningNow) return;
    await FlutterBluePlus.stopScan();
  }

  @override
  Stream<List<ScanResult>> get scanResults => FlutterBluePlus.scanResults;

  @override
  Stream<bool> get isScanning => FlutterBluePlus.isScanning;

  @override
  Future<bool> get isSupported => FlutterBluePlus.isSupported;

  @override
  Future<void> turnOn() => FlutterBluePlus.turnOn();

  @override
  Future<List<BluetoothService>> connect(String uuid) async {
    final device = BluetoothDevice.fromId(uuid);
    if (!device.isConnected) await device.connect();
    return await device.discoverServices();
  }

  @override
  Future<void> disconnect(String uuid) async {
    final device = BluetoothDevice.fromId(uuid);
    if (device.isConnected) await device.disconnect();
  }

  @override
  Stream<bool> connected(String uuid) => BluetoothDevice.fromId(uuid)
      .connectionState
      .map((event) => event == BluetoothConnectionState.connected);

  @override
  Future<bool> isConnected(String uuid) async =>
      BluetoothDevice.fromId(uuid).isConnected;

  @override
  Future<List<int>?> readCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    //   bool notify,
  ) async {
    final device = BluetoothDevice.fromId(deviceUuid);

    if (!device.isConnected || device.servicesList.isEmpty) return null;

    final characteristics = device.servicesList
        .firstWhere((e) => e.serviceUuid == Guid(serviceUuid))
        .characteristics
        .firstWhere((element) =>
            element.characteristicUuid == Guid(characteristicsUuid));

    // final data = characteristics.lastValueStream;
    const bool notify = false;
    if (characteristics.isNotifying != notify) {
      await characteristics.setNotifyValue(notify);
    }

    return await characteristics.read();
  }

  @override
  Future<void> writeCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    List<int> value,
    // bool notify,
  ) async {
    final device = BluetoothDevice.fromId(deviceUuid);

    if (!device.isConnected || device.servicesList.isEmpty) return;

    final characteristics = device.servicesList
        .firstWhere((e) => e.serviceUuid == Guid(serviceUuid))
        .characteristics
        .firstWhere((element) =>
            element.characteristicUuid == Guid(characteristicsUuid));

    const bool notify = false;
    if (characteristics.isNotifying != notify) {
      await characteristics.setNotifyValue(notify);
    }

    return await characteristics.write(value);
  }
}
