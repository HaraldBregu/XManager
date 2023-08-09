import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class ExitUserUseCase implements UseCase<bool, NoParams> {
  ExitUserUseCase(this._userRepository);

  final AppRepository _userRepository;

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    // TODO: implement call
    throw UnimplementedError();
  }

  // @override
  // Future<DataState<bool>> call(void params) {
  //   return _userRepository.exitUser();
  // }
}
