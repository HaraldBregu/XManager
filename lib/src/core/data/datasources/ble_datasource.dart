import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/ble_device_model.dart';

abstract class BleDataSource {
  Stream<List<BleDeviceModel>> startScan(int seconds);
  Stream<bool> isScanning();
  Future<void> stopScan();
  Future<bool> isAvailable();
  Future<void> turnOn();
}

class BleDataSourceImpl implements BleDataSource {
  BleDataSourceImpl();

  @override
  Stream<List<BleDeviceModel>> startScan(int seconds) {
    print("start");

    FlutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
    );


    final test = FlutterBluePlus.scanResults.asyncMap((event) {
      print("searching: ${event.length}");

      return List<BleDeviceModel>.from(
        event.map(
          (e) {
            final device = e.device;
            print("device name");

            print(device.localName);
            return BleDeviceModel(
              name: device.localName,
              uuid: device.remoteId.toString(),
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
