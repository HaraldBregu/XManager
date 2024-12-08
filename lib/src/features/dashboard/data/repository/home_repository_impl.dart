import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/dashboard/data/models/home_model.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/home_repository.dart';
import 'package:xmanager/src/shared/data/models/device_program_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl();

  @override
  Future<Either<Failure, HomeModel>> get homeEntity =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, List<DeviceProgramModel>>> get myPrograms =>
      throw UnimplementedError();
}
