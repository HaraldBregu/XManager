import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/home/data/models/home_model.dart';
import 'package:xmanager/src/features/home/domain/repositories/home_repository.dart';
import 'package:xmanager/src/shared/data/models/program_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  const HomeRepositoryImpl();

  @override
  Future<Either<Failure, HomeModel>> get homeEntity =>
      throw UnimplementedError();

  @override
  Future<Either<Failure, List<ProgramModel>>> get myPrograms =>
      throw UnimplementedError();
}
