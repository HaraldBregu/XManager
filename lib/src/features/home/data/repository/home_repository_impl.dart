import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/home/data/models/home_model.dart';
import 'package:xmanager/src/features/home/domain/repositories/home_repository.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl();

  @override
  Future<Either<Failure, HomeModel>> get homeEntity =>
      throw UnimplementedError();

  @override
  // TODO: implement myPrograms
  Future<Either<Failure, List<DeviceProgramEntity>>> get myPrograms =>
      throw UnimplementedError();
}
