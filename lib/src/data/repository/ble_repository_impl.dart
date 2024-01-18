import 'package:xmanager/src/data/datasources/local/ble_datasource.dart';
import 'package:xmanager/src/data/models/bluetooth_device_model.dart';
import 'package:xmanager/src/data/models/bluetooth_service_model.dart';
import 'package:xmanager/src/domain/entities/bluetooth_service_entity.dart';
import 'package:xmanager/src/domain/repository/ble_repository.dart';

class BleRepositoryImpl implements BleRepository {
  const BleRepositoryImpl(this._dataSource);
  final BleDataSourceImpl _dataSource;

  @override
  Future<void> startScan(int seconds, List<String>? services) =>
      _dataSource.startScan(seconds, services);

  @override
  Stream<List<BluetoothDeviceModel>> get scanResult =>
      _dataSource.scanResults.asyncMap(
        (event) {
          return List<BluetoothDeviceModel>.from(
            event.map(
              (e) {
                final device = e.device;
                return BluetoothDeviceModel(
                  name: device.localName,
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
  Future<void> stopScan() => _dataSource.stopScan();

  @override
  Future<void> connect(String uuid) => _dataSource.connect(uuid);

  @override
  Future<void> connectAndDiscoverServices(String uuid) =>
      _dataSource.connectAndDiscoverServices(uuid);
  
  @override
  Future<void> discoverServices(String uuid) =>
      _dataSource.discoverServices(uuid);
  
  @override
  Future<void> disconnect(String uuid) => _dataSource.disconnect(uuid);

  @override
  Stream<bool> connected(String uuid) => _dataSource.connected(uuid);

  @override
  Future<bool> isConnected(String uuid) => _dataSource.isConnected(uuid);

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
