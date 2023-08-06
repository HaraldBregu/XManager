import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';

abstract class BleRepository {
  Stream<List<BleDeviceEntity>> startScan(int seconds);
  Stream<bool> isScanning();
  Future<void> stopScan();
}
