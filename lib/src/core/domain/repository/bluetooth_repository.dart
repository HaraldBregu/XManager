import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';

abstract class BluetoothRepository {
  Future<void> startScan(int seconds);
  Stream<List<BluetoothDeviceEntity>> get scanResult;
  Stream<bool> get isScanning;
  Future<void> stopScan();
  Future<void> connect(String uuid);
  Future<void> disconnect(String uuid);
  Stream<bool> connected(String uuid);
  Future<List<BluetoothServiceEntity>> discoverServices(String uuid);
}
