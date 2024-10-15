import 'package:dartz/dartz.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/data/datasources/local/ble_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/local/permissions_datasource.dart';
import 'package:xmanager/src/shared/data/models/bluetooth_device_model.dart';
import 'package:xmanager/src/shared/domain/repository/ble_repository.dart';

class BleRepositoryImpl implements BleRepository {
  const BleRepositoryImpl(this._dataSource, this._permissionsDataSource);
  final BleDataSource _dataSource;
  final PermissionsDataSource _permissionsDataSource;

  @override
  Future<void> startScan(int seconds, List<String>? services) async {
    _dataSource.startScan(seconds, services);
  }

  @override
  Stream<List<BluetoothDeviceModel>> get scanResult =>
      _dataSource.scanResults.asyncMap(
        (event) {
          return List<BluetoothDeviceModel>.from(
            event.map(
              (e) {
                final device = e.device;
                return BluetoothDeviceModel(
                  name: device.platformName,
                  uuid: device.remoteId.toString(),
                );
              },
            ),
          );
        },
      );

  @override
  Stream<bool> get isScanning => _dataSource.isScanning;

  @override
  Stream<AppBluetoothAdapterState> get adapterState => _dataSource.adapterState;

  @override
  Future<void> stopScan() => _dataSource.stopScan();

  @override
  Future<Either<Failure, void>> connect(String uuid) async {
    final bcPermissions =
        await _permissionsDataSource.bluetoothConnectPermissionsStatus();

    if (bcPermissions == AppPermissionStatus.denied) {
      return Left(PermissionsDeniedFailure());
    }

    if (bcPermissions == AppPermissionStatus.permanentlyDenied) {
      return Left(PermissionsPermanentlyDeniedFailure());
    }

    try {
      await _dataSource.connect(uuid);
    } on FlutterBluePlusException catch (e) {
      return Left(BluetoothConnectionFailure());
    } on PlatformException catch (e) {
      return Left(PlatformFailure());
    } catch (e) {
      return Left(PlatformFailure());
    }

    return const Right(null);
  }

  @override
  Future<void> connectAndDiscoverServices(String uuid) async {
    await _dataSource.connectAndDiscoverServices(uuid);
  }

  @override
  Future<Either<Failure, void>> discoverServices(String uuid) async {
    try {
      await _dataSource.discoverServices(uuid);
    } catch (e) {
      return Left(BluetoothDiscoverServicesFailure());
    }
    return const Right(null);
  }

  @override
  Future<void> disconnect(String uuid) => _dataSource.disconnect(uuid);

  @override
  Stream<bool> connected(String uuid) => _dataSource.connected(uuid);

  @override
  Future<bool> isConnected(String uuid) async {
    return await _dataSource.isConnected(uuid);
  }

  @override
  Future write(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    List<int> value,
    bool withoutResponse,
  ) =>
      _dataSource.writeCharacteristic(
        deviceUuid,
        serviceUuid,
        characteristicsUuid,
        value,
        withoutResponse,
      );

  @override
  Future<List<int>> read(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  ) =>
      _dataSource.readCharacteristic(
        deviceUuid,
        serviceUuid,
        characteristicsUuid,
      );

  @override
  Stream<List<int>> lastValueStream(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
  ) =>
      _dataSource.lastValueStream(
        deviceUuid,
        serviceUuid,
        characteristicsUuid,
      );

  @override
  Future<void> setNotifications(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    bool enable,
  ) =>
      _dataSource.setNotifications(
        deviceUuid,
        serviceUuid,
        characteristicsUuid,
        enable,
      );
}
