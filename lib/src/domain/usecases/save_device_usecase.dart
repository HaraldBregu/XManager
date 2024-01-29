import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/device_entity.dart';
import 'package:xmanager/src/domain/repository/device_repository.dart';

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
