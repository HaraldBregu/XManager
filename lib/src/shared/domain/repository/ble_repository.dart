import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/domain/entities/bluetooth_device_entity.dart';

abstract class BleRepository {
  Future<void> startScan(int seconds, List<String>? services);
  Stream<List<BluetoothDeviceEntity>> get scanResult;
  Stream<bool> get isScanning;
  Future<void> stopScan();
  Future<Either<Failure, void>> connect(String uuid);
  Future<void> connectAndDiscoverServices(String uuid);
  Future<Either<Failure, void>> discoverServices(String uuid);
  Future<void> disconnect(String uuid);
  Stream<bool> connected(String uuid);
  Stream<AppBluetoothAdapterState> get adapterState;
  Future<bool> isConnected(String uuid);
  Future<bool> get isOn;
  Future<Either<Failure, void>> turnOn();

  Future write(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    List<int> value,
    bool withoutResponse,
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
