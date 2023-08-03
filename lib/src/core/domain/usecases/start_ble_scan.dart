import 'package:xmanager/src/core/data/models/ble_device_model.dart';
import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class StartBleScanUseCase implements StreamUseCase<List<BleDeviceModel>, int> {
  final BleRepository _bleRepository;

  const StartBleScanUseCase(this._bleRepository);

  @override
  Stream<List<BleDeviceModel>> call(int second) {
    return _bleRepository.startScan(second);
  }
}
