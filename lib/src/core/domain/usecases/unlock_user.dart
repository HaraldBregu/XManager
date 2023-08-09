import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class UnlockUserUseCase implements UseCase<bool, String> {
  final AppRepository _userRepository;

  UnlockUserUseCase(this._userRepository);

  @override
  Future<Either<Failure, bool>> call(String params) {
    throw UnimplementedError();
  }

  // @override
  // Future<DataState<bool>> call(String params) {
  //   return _userRepository.saveFullName(params);
  // }
}
