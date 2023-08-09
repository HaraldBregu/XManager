import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/app_entity.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class GetAppUseCase implements UseCase<AppEntity, NoParams> {
  GetAppUseCase(this._userRepository);

  final AppRepository _userRepository;

  @override
  Future<Either<Failure, AppEntity>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  // @override
  // Future<DataState<AppEntity>> call(void params) {
  //   return _userRepository.getApp();
  // }
}
