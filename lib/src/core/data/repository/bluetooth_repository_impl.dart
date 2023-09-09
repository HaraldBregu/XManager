import 'package:xmanager/src/core/data/datasources/bluetooth_datasource.dart';
import 'package:xmanager/src/core/data/models/bluetooth_device_model.dart';
import 'package:xmanager/src/core/domain/repository/bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  const BluetoothRepositoryImpl(this._dataSource);
  final BluetoothDataSourceImpl _dataSource;

  @override
  Stream<List<BluetoothDeviceModel>> startScan(int seconds) =>
      _dataSource.startScan(seconds);

  @override
  Stream<bool> get isScanning => _dataSource.isScanning;

  @override
  Future<void> stopScan() => _dataSource.stopScan();

  @override
  Future<void> connect(String uuid) => _dataSource.connect(uuid);

  @override
  Stream<bool> connected(String uuid) => _dataSource.connected(uuid);
}
