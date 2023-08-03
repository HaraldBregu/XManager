import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/ble_device_model.dart';

abstract class BleDataSource {
  Stream<List<BleDeviceModel>> startScan(int seconds);
  Future stopScan();
  Stream<List<BleDeviceModel>> scanResult();
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
      return List<BleDeviceModel>.from(event.map((e) =>
          BleDeviceModel(name: e.device.name, uuid: e.device.id.toString())));
    });
    return test;
    //return flutterBluePlus.scanResults;

    /*
    await for (final results in flutterBluePlus.scanResults) {
      for (ScanResult r in results) {
        print('${r.device.name} found! rssi: ${r.device.id}');
      }
    }*/

    /*
    await for (final scanResults in flutterBluePlus.scanResults) {
      final List<BleDeviceModel> bleDevices = [];

      for (final scanResult in scanResults) {
        final device = scanResult.device;
        final deviceName = device.name;
        final deviceId = device.id.toString();

        bleDevices.add(
          BleDeviceModel(
            name: deviceName,
            uuid: deviceId,
          ),
        );
      }
      yield bleDevices;
    }
    */
  }

  @override
  Future stopScan() {
    return flutterBluePlus.stopScan();
  }

  @override
  Stream<List<BleDeviceModel>> scanResult() async* {
    await for (final scanResults in flutterBluePlus.scanResults) {
      final List<BleDeviceModel> bleDevices = [];

      for (final scanResult in scanResults) {
        final device = scanResult.device;
        final deviceName = device.name;
        final deviceId = device.id.toString();

        bleDevices.add(
          BleDeviceModel(
            name: deviceName,
            uuid: deviceId,
          ),
        );
      }

      yield bleDevices;
    }
  }
}
