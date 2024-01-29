import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/device_entity.dart';
import 'package:xmanager/src/domain/repository/device_repository.dart';

class GetDeviceUsecase implements UseCase<DeviceEntity, String> {
  final DeviceRepository deviceRepository;

  GetDeviceUsecase(this.deviceRepository);

  @override
  Future<Either<Failure, DeviceEntity>> call(String type) {
    return deviceRepository.getDeviceByType(type);
  }
}
