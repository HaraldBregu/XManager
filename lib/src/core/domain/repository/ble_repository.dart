import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';

abstract class BleRepository {
  Future<void> startScan(int seconds, List<String>? services);
  Stream<List<BluetoothDeviceEntity>> get scanResult;
  Stream<bool> get isScanning;
  Future<void> stopScan();
  Future<List<BluetoothServiceEntity>> connect(String uuid);
  Future<void> disconnect(String uuid);
  Stream<bool> connected(String uuid);
  Future<bool> isConnected(String uuid);

  Future write(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    List<int> value,
  );

  Future<List<int>> read(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  );

  Stream<List<int>> lastValueStream(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  );

  Future<void> setNotifications(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    bool enable,
  );
  
}
