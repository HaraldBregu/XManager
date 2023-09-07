import 'package:xmanager/src/core/data/datasources/ble_datasource.dart';
import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';

class BleRepositoryImpl implements BleRepository {
  final BleDataSourceImpl _dataSource;

  const BleRepositoryImpl(this._dataSource);

  @override
  Stream<List<BleDeviceEntity>> startScan(int seconds) =>
      _dataSource.startScan(seconds);

  @override
  Stream<bool> isScanning() => _dataSource.isScanning();

  @override
  Future<void> stopScan() => _dataSource.stopScan();
  
}
