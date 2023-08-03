import 'package:xmanager/src/core/domain/repository/ble_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class GetBleDevicesUseCase implements StreamUseCase<double, int> {
  final BleRepository _bleRepository;

  const GetBleDevicesUseCase(this._bleRepository);

/*
  Stream<double> getRandomValues() async* {
    final random = Random(2);
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      yield random.nextDouble();
    }
  }
  */

  @override
  Stream<double> call(int seconds) {
    final sec = seconds;
    return _bleRepository.getRandomValues();
  }
}
