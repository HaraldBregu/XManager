import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase.dart';
import '../entities/device_entity.dart';
import '../repository/device_repository.dart';

class SaveDeviceUsecase implements UseCase<DeviceEntity, DeviceParams> {
  final DeviceRepository deviceRepository;

  SaveDeviceUsecase(this.deviceRepository);

  @override
  Future<Either<Failure, DeviceEntity>> call(DeviceParams params) {
    return deviceRepository.saveDevice(
      type: params.type,
      name: params.name,
      version: params.version,
    );
  }
}
