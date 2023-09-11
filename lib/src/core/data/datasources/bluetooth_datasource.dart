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
  Future<List<BluetoothService>> discoverServices(String uuid);

}

class BluetoothDataSourceImpl implements BluetoothDataSource {
  BluetoothDataSourceImpl();

  @override
  Future<void> startScan(int seconds) async {
    if (FlutterBluePlus.isScanningNow) return;
    await FlutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
      scanMode: ScanMode.lowLatency,
      withServices: const [],
      macAddresses: const [],
      allowDuplicates: false,
      androidUsesFineLocation: false,
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

  
//   test(String uuid) async {
//     final device = BluetoothDevice.fromId(uuid);
//     final services = await device.discoverServices();
// final service = services.first;
// BluetoothServiceEntity
// //BluetoothService.fromProto(BmBluetoothService(serviceUuid: serviceUuid, remoteId: remoteId, isPrimary: isPrimary, characteristics: characteristics, includedServices: includedServices))

//   }


}
