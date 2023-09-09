import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/domain/repository/bluetooth_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class BluetoothStartScan
    implements StreamUseCase<List<BluetoothDeviceEntity>, int> {
  const BluetoothStartScan(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Stream<List<BluetoothDeviceEntity>> call(int seconds) {
    return _bleRepository.startScan(seconds);
  }
}

class BluetoothIsScanning implements StreamUseCase<bool, NoParams> {
  const BluetoothIsScanning(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Stream<bool> call(NoParams params) => _bleRepository.isScanning;
}

class BluetoothConnectDevice implements UseCase<void, String> {
  const BluetoothConnectDevice(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Future<Either<Failure, void>> call(String uuid) async {
    return Right(_bleRepository.connect(uuid));
  }
}

class BluetoothDeviceConnected implements StreamUseCase<bool, String> {
  const BluetoothDeviceConnected(this._bleRepository);
  final BluetoothRepository _bleRepository;

  @override
  Stream<bool> call(String uuid) => _bleRepository.connected(uuid);
}
