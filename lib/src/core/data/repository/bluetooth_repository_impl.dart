import 'package:xmanager/src/core/data/datasources/local/bluetooth_datasource.dart';
import 'package:xmanager/src/core/data/models/bluetooth_device_model.dart';
import 'package:xmanager/src/core/data/models/bluetooth_service_model.dart';
import 'package:xmanager/src/core/domain/repository/bluetooth_repository.dart';

class BluetoothRepositoryImpl implements BluetoothRepository {
  const BluetoothRepositoryImpl(this._dataSource);
  final BluetoothDataSourceImpl _dataSource;

  @override
  Future<void> startScan(int seconds) => _dataSource.startScan(seconds);

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
  Future<void> disconnect(String uuid) => _dataSource.disconnect(uuid);

  @override
  Stream<bool> connected(String uuid) => _dataSource.connected(uuid);

  @override
  Future<List<BluetoothServiceModel>> discoverServices(String uuid) async {
    final services = await _dataSource.discoverServices(uuid);

    final newServices = services.map((e) {
      final chars = e.characteristics.map((ch) {
        final descrs = ch.descriptors.map((des) {
          return BluetoothDescriptorModel(
            characteristicUuid: des.characteristicUuid.toString(),
            descriptorUuid: des.descriptorUuid.toString(),
          );
        }).toList();

        return BluetoothCharacteristicModel(
          characteristicUuid: ch.characteristicUuid.toString(),
          descriptors: descrs,
        );
      }).toList();

      // final inclServ = e.includedServices.map((e) {
      //   return BluetoothServiceModel(
      //     remoteId: e.remoteId.str,
      //     serviceUuid:  e.serviceUuid.toString(),
      //     isPrimary: e.isPrimary,
      //     characteristics: [],
      //     includedServices: includedServices),
      // }):

      return BluetoothServiceModel(
        remoteId: e.remoteId.str,
        serviceUuid: e.serviceUuid.toString(),
        isPrimary: e.isPrimary,
        characteristics: chars,
        includedServices: const [],
      );
    }).toList();

    return newServices;
  }
}
