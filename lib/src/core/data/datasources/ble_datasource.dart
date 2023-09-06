import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/ble_device_model.dart';

abstract class BleDataSource {
  Future<void> startScan(int seconds);
  Stream<List<BleDeviceModel>> scanResults();
  Stream<bool> isScanning();
  Future<void> stopScan();
  Future<bool> isAvailable();
  Future<void> turnOn();
}

class BleDataSourceImpl implements BleDataSource {
  BleDataSourceImpl();

  @override
  Future<bool> startScan(int seconds) async {
    await FlutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
    );

    return true;
  }

  @override
  Stream<List<BleDeviceModel>> scanResults() {
    final test = FlutterBluePlus.scanResults.asyncMap((event) {
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
    return FlutterBluePlus.isScanning;
  }

  @override
  Future stopScan() {
    return FlutterBluePlus.stopScan();
  }

  @override
  Future<bool> isAvailable() {
    return FlutterBluePlus.isAvailable;
  }

  @override
  Future<void> turnOn() {
    return FlutterBluePlus.turnOn();
  }

  // @override
  // Future<void> turnOff() {
  //   return FlutterBluePlus.turnOff();
  // }

  // @override
  // Future<bool> isOn() {
  //   return FlutterBluePlus.isOn;
  // }
}
