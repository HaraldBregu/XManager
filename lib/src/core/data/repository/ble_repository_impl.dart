import 'package:xmanager/src/core/data/datasources/local/ble_datasource.dart';
import 'package:xmanager/src/core/data/models/bluetooth_device_model.dart';
import 'package:xmanager/src/core/data/models/bluetooth_service_model.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';

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
  Future<List<BluetoothServiceModel>> connect(String uuid) async {
    final services = await _dataSource.connect(uuid);

    return services.map((e) {
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
  }

  @override
  Future<void> disconnect(String uuid) => _dataSource.disconnect(uuid);

  @override
  Stream<bool> connected(String uuid) => _dataSource.connected(uuid);
/*
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

  @override
  Future<List<BluetoothServiceEntity>> servicesList(String uuid) async {
    final services = await _dataSource.servicesList(uuid);

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
*/
  @override
  Future<bool> isConnected(String uuid) => _dataSource.isConnected(uuid);

  @override
  Future write(
    String deviceUuid,
    String serviceUuid,
    String characteristicsUuid,
    List<int> value,
  ) {
    return _dataSource.writeCharacteristic(
      deviceUuid,
      serviceUuid,
      characteristicsUuid,
      value,
    );
  }
}
