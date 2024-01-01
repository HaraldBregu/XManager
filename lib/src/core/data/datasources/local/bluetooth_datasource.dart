import 'dart:async';

import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/bluetooth_device_model.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';

abstract class BluetoothDataSource {
  Future<void> startScan(int seconds);
  Future<void> stopScan();
  Stream<List<ScanResult>> get scanResults;
  Stream<bool> get isScanning;
  Future<bool> get isAvailable;
  Future<void> turnOn();
  Future<void> connect(String uuid);
  Future<void> disconnect(String uuid);
  Stream<bool> connected(String uuid);
  Future<bool> isConnected(String uuid);
  Future<List<BluetoothService>> discoverServices(String uuid);
  Future<List<BluetoothService>> servicesList(String uuid);
  Future<void> readCharacteristic(String uuid);
  Future<void> writeCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  );
}

class BluetoothDataSourceImpl implements BluetoothDataSource {
  BluetoothDataSourceImpl();

  @override
  Future<void> startScan(int seconds) async {
    if (FlutterBluePlus.isScanningNow) return;
    await FlutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
      //scanMode: ScanMode.lowLatency,
      //withServices: [Guid("00001600-1212-efde-1523-785feabcd121")],
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
  Future<bool> get isAvailable => FlutterBluePlus.isAvailable;

  @override
  Future<void> turnOn() => FlutterBluePlus.turnOn();

  @override
  Future<void> connect(String uuid) => BluetoothDevice.fromId(uuid).connect();

  @override
  Future<void> disconnect(String uuid) async =>
      BluetoothDevice.fromId(uuid).disconnect();

  @override
  Stream<bool> connected(String uuid) {
    final bleDevice = BluetoothDevice.fromId(uuid);
    return bleDevice.connectionState.map((event) {      
      final isConnected = (event == BluetoothConnectionState.connected);
      return isConnected;
    });
  }

  @override
  Future<List<BluetoothService>> discoverServices(String uuid) {
    final device = BluetoothDevice.fromId(uuid);
    final services = device.discoverServices();  
    return services;
  }
  @override
  Future<List<BluetoothService>> servicesList(String uuid) async =>
      BluetoothDevice.fromId(uuid).servicesList;
  
  @override
  Future<bool> isConnected(String uuid) async {
    final bleDevice = BluetoothDevice.fromId(uuid);
    return bleDevice.isConnected;
  }

  @override
  Future<void> readCharacteristic(String uuid) async {
    final device = BluetoothDevice.fromId(uuid);
    final services = await device.discoverServices();

    final service = services.firstWhere((element) => element.serviceUuid == "");
    final characteristics = service.characteristics;
    final chr = characteristics
        .firstWhere((element) => element.characteristicUuid == "");
    chr.write([0x03]);
    chr.setNotifyValue(true);
    chr.read();

    final test = services
        .firstWhere(
          (element) => element.serviceUuid == Guid("serviceuuid"),
        )
        .characteristics
        .firstWhere(
          (element) => element.characteristicUuid == Guid("serviceuuid"),
        );

    final f = BluetoothCharacteristic.fromProto(
        BmBluetoothCharacteristic.fromMap({}));
  }
  
  @override
  Future<void> writeCharacteristic(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  ) {
    final device = BluetoothDevice.fromId(deviceUuid);
    final services = device.servicesList;
    print("service list");
    print(services);
    final characteristics = services
        .firstWhere(
          (element) => element.serviceUuid == Guid(serviceUuid),
        )
        .characteristics
        .firstWhere(
          (element) => element.characteristicUuid == Guid(characteristicsUuid),
        );
    print("chars list");
    print(characteristics);
    return characteristics.write([0x01, 0x02, 0x00, 0x05]);
  }
  

}
