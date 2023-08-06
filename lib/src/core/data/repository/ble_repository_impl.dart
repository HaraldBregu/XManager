import 'package:xmanager/src/core/data/datasources/ble_datasource.dart';
import 'package:xmanager/src/core/data/models/ble_device_model.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';

class BleRepositoryImpl implements BleRepository {
  final BleDataSourceImpl _bleDataSourceImpl;

  const BleRepositoryImpl(this._bleDataSourceImpl);

  @override
  Stream<List<BleDeviceModel>> startScan(int seconds) {
    return _bleDataSourceImpl.startScan(seconds);
  }

  @override
  Stream<bool> isScanning() {
    throw _bleDataSourceImpl.isScanning();
  }

  @override
  Future<void> stopScan() {
    return _bleDataSourceImpl.stopScan();
  }
  
}
