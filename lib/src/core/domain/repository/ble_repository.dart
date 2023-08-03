import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';

abstract class BleRepository {
  Stream<double> getRandomValues();
  Future<void> startScan(int seconds);
  Future<void> stopScan();
  Stream<List<BleDeviceEntity>> scanResult();
}
