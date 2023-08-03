import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/ble_device_model.dart';

abstract class BleDataSource {
  Future<void> startScan(int seconds);
  Stream<List<BleDeviceModel>> scanResult();
}

class BleDataSourceImpl implements BleDataSource {
  final FlutterBluePlus flutterBluePlus;

  BleDataSourceImpl({
    required this.flutterBluePlus,
  });

  @override
  Future<void> startScan(int seconds) async {
    flutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
    );
  }

  @override
  Stream<List<BleDeviceModel>> scanResult() async* {
    await for (final scanResults in flutterBluePlus.scanResults) {
      final List<BleDeviceModel> bleDevices = [];
      for (final scanResult in scanResults) {
        final deviceName = scanResult.device.name;
        final deviceId = scanResult.device.id.toString();
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
