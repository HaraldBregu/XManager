import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class GetAppPermissionsUseCase implements UseCase<bool, NoParams> {
  GetAppPermissionsUseCase();

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class RequestAppPermissionsUseCase implements UseCase<bool, String> {
  RequestAppPermissionsUseCase();

  @override
  Future<Either<Failure, bool>> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}

class AppPermissionsStatusUseCase implements UseCase<bool, String> {
  AppPermissionsStatusUseCase();

  @override
  Future<Either<Failure, bool>> call(String params) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
