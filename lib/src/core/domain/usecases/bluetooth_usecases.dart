import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_service_entity.dart';
import 'package:xmanager/src/core/domain/repository/bluetooth_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class BluetoothStartScan implements BaseUseCase<void, int> {
  const BluetoothStartScan(this._bluetoothRepository);
  final BluetoothRepository _bluetoothRepository;

  @override
  Future<void> call(int seconds) => _bluetoothRepository.startScan(seconds);
}

class BluetoothStopScan implements UseCase<void, NoParams> {
  const BluetoothStopScan(this._bluetoothRepository);
  final BluetoothRepository _bluetoothRepository;

  @override
  Future<Either<Failure, void>> call(NoParams seconds) async =>
      Right(await _bluetoothRepository.stopScan());
}

class BluetoothScanResults
    implements StreamUseCase<List<BluetoothDeviceEntity>, NoParams> {
  const BluetoothScanResults(this._bluetoothRepository);
  final BluetoothRepository _bluetoothRepository;

  @override
  Stream<List<BluetoothDeviceEntity>> call(NoParams seconds) =>
      _bluetoothRepository.scanResult;
}


class BluetoothIsScanning implements StreamUseCase<bool, NoParams> {
  const BluetoothIsScanning(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Stream<bool> call(NoParams params) => _bleRepository.isScanning;
}

class BluetoothConnectDeviceUseCase implements BaseUseCase<void, String> {
  const BluetoothConnectDeviceUseCase(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Future<void> call(String uuid) async {
    return _bleRepository.connect(uuid);
  }
}

class BluetoothDisconnectDevice implements UseCase<void, String> {
  const BluetoothDisconnectDevice(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Future<Either<Failure, void>> call(String uuid) async {
    return Right(_bleRepository.disconnect(uuid));
  }
}

class BluetoothDeviceConnected implements StreamUseCase<bool, String> {
  const BluetoothDeviceConnected(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Stream<bool> call(String uuid) => _bleRepository.connected(uuid);
}

class BluetoothDeviceIsConnectedUseCase implements BaseUseCase<bool, String> {
  const BluetoothDeviceIsConnectedUseCase(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Future<bool> call(String uuid) => _bleRepository.isConnected(uuid);
}

class BluetoothDiscoverServices
    implements BaseUseCase<List<BluetoothServiceEntity>, String> {
  const BluetoothDiscoverServices(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Future<List<BluetoothServiceEntity>> call(String uuid) =>
      _bleRepository.discoverServices(uuid);
  
}

class BluetoothServicesList
    implements BaseUseCase<List<BluetoothServiceEntity>, String> {
  const BluetoothServicesList(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Future<List<BluetoothServiceEntity>> call(String uuid) =>
      _bleRepository.servicesList(uuid);
}

class BluetoothWriteUseCase implements BaseUseCase<void, BleWriteParams> {
  const BluetoothWriteUseCase(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Future<void> call(BleWriteParams params) {
    return _bleRepository.write(
      params.deviceUuid,
      params.serviceUuid,
      params.characteristicsUuid,
    );
  }
}
