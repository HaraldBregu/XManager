import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';

class LogInWithEmailUseCase implements UseCase<bool, LoginParams> {
  final UserRepository _userRepository;

  LogInWithEmailUseCase(this._userRepository);

  @override
  Future<Either<Failure, bool>> call(LoginParams params) async =>
      _userRepository.login(params.email, params.password);
}
