import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';

abstract class BluetoothRepository {
  Stream<List<BluetoothDeviceEntity>> startScan(int seconds);
  Stream<bool> get isScanning;
  Future<void> stopScan();
  Future<void> connect(String uuid);
  Stream<bool> connected(String uuid);
}
