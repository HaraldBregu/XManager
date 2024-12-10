import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/home/domain/entities/home_entity.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeEntity>> get homeEntity;
  Future<Either<Failure, List<DeviceProgramEntity>>> get myPrograms;
}
