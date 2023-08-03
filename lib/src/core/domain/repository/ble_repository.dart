import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/ble_device_model.dart';
import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';

abstract class BleRepository {
  Stream<List<BleDeviceModel>> startScan(int seconds);
  Future<void> stopScan();
  Stream<List<BleDeviceEntity>> scanResult();
}
