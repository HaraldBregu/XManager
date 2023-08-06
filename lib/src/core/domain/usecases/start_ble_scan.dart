import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class StartBleScanUseCase implements StreamUseCase<List<BleDeviceEntity>, int> {
  final BleRepository _bleRepository;

  const StartBleScanUseCase(this._bleRepository);

  @override
  Stream<List<BleDeviceEntity>> call(int second) {
    return _bleRepository.startScan(second);
  }
}
