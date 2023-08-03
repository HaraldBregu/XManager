import 'dart:math';
import 'package:xmanager/src/core/data/datasources/ble_datasource.dart';
import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';

/*
class BluetoothService {
  final FlutterBluePlus _flutterBlue = FlutterBluePlus.instance;

  void getstream() {
// Setup Listener for scan results
// device not found? see "Common Problems" in the README
    var subscription = FlutterBluePlus.instance.scanResults.listen((results) {
      for (ScanResult r in results) {}
    });
  }

  Stream<BleDeviceEntity> receiveDataFromBluetooth() async* {
    try {
      // Start scanning for devices and connect to the desired Bluetooth device
      await _flutterBlue.startScan();

// Setup Listener for scan results
// device not found? see "Common Problems" in the README
      var subscription = FlutterBluePlus.instance.scanResults.listen((results) {
        for (ScanResult r in results) {}
      });

      var devices = await _flutterBlue.scanResults.first;
      var device = devices.first.device;
      await device.connect();
      //var services = await device.discoverServices();
      //var characteristic = services.firstWhere((service) => service.uuid.toString() == 'YOUR_CHARACTERISTIC_UUID');

      // Start listening to characteristic notifications to receive data
      //await characteristic.setNotifyValue(true);
      //await characteristic.characteristic!.value;
      /*await for (var value in characteristic.value) {
        yield String.fromCharCodes(value);
      }*/
    } catch (e) {
      // Handle errors if necessary
    }
  }
}
*/

class BleRepositoryImpl implements BleRepository {
  final BleDataSourceImpl _bleDataSourceImpl;

  const BleRepositoryImpl(this._bleDataSourceImpl);
  @override
  Stream<double> getRandomValues() async* {
    final random = Random(2);
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      yield random.nextDouble();
    }
  }

  @override
  Future<void> startScan(int seconds) {
    throw _bleDataSourceImpl.startScan(seconds);
  }

  @override
  Stream<List<BleDeviceEntity>> scanResult() {
    return _bleDataSourceImpl.scanResult();
  }

  @override
  Future<void> stopScan() {
    // TODO: implement stopScan
    throw UnimplementedError();
  }

/*
  @override
  Stream<void> scanResult() {
    return _bleDataSourceImpl.scanResult();
  }*/
}
