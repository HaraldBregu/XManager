import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/bluetooth_device_model.dart';

abstract class BluetoothDataSource {
  Stream<List<BluetoothDeviceModel>> startScan(int seconds);
  Stream<bool> get isScanning;
  Future<void> stopScan();
  Future<bool> get isAvailable;
  Future<void> turnOn();
  Future<void> connect(String uuid);
  Future<void> disconnect(String uuid);
  Stream<bool> connected(String uuid);
}

class BluetoothDataSourceImpl implements BluetoothDataSource {
  BluetoothDataSourceImpl();

  @override
  Stream<List<BluetoothDeviceModel>> startScan(int seconds) {
    FlutterBluePlus.startScan(
      timeout: Duration(seconds: seconds),
    );

    final test = FlutterBluePlus.scanResults.asyncMap((event) {
      return List<BluetoothDeviceModel>.from(
        event.map(
          (e) {
            final device = e.device;
            return BluetoothDeviceModel(
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
  Stream<bool> get isScanning => FlutterBluePlus.isScanning;

  @override
  Future stopScan() => FlutterBluePlus.stopScan();

  @override
  Future<bool> get isAvailable => FlutterBluePlus.isAvailable;

  @override
  Future<void> turnOn() => FlutterBluePlus.turnOn();

  @override
  Future<void> connect(String uuid) {
    return BluetoothDevice.fromId(uuid).connect();
  }

  @override
  Future<void> disconnect(String uuid) async {
    return BluetoothDevice.fromId(uuid).disconnect();
  }

  @override
  Stream<bool> connected(String uuid) {
    final bleDevice = BluetoothDevice.fromId(uuid);

    final result = bleDevice.connectionState.map((event) {
      final isConnected = (event == BluetoothConnectionState.connected);
      return isConnected;
    });

    return result;
  }
}
