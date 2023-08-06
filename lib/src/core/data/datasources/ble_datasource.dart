import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/ble_device_model.dart';

abstract class BleDataSource {
  Stream<List<BleDeviceModel>> startScan(int seconds);
  Stream<bool> isScanning();
  Future<void> stopScan();
  Future<bool> isAvailable();
  Future<void> turnOn();
  Future<void> turnOff();
  Future<bool> isOn();
}

class BleDataSourceImpl implements BleDataSource {
  final FlutterBluePlus flutterBluePlus;

  BleDataSourceImpl({
    required this.flutterBluePlus,
  });

  @override
  Stream<List<BleDeviceModel>> startScan(int seconds) {
    flutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
    );

    final test = flutterBluePlus.scanResults.asyncMap((event) {
      return List<BleDeviceModel>.from(
        event.map(
          (e) {
            final device = e.device;
            return BleDeviceModel(
              name: device.name,
              uuid: device.id.toString(),
            );
          },
        ),
      );
    });
    return test;
  }
  
  @override
  Stream<bool> isScanning() {
    return flutterBluePlus.isScanning;
  }

  @override
  Future stopScan() {
    return flutterBluePlus.stopScan();
  }
  
  @override
  Future<bool> isAvailable() {
    return flutterBluePlus.isAvailable;
  }
  
  @override
  Future<void> turnOn() {
    return flutterBluePlus.turnOn();
  }
  
  @override
  Future<void> turnOff() {
    return flutterBluePlus.turnOff();
  }
  
  @override
  Future<bool> isOn() {
    return flutterBluePlus.isOn;
  }

}
