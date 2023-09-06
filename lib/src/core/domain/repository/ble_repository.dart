import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';

abstract class BleRepository {
  Future<bool> startScan(int seconds);
  Stream<List<BleDeviceEntity>> scanResults();
  Stream<bool> isScanning();
  Future<void> stopScan();
}
