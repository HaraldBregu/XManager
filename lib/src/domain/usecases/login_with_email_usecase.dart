import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/user_entity.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';

class LogInWithEmailUseCase implements UseCase<UserEntity, LoginParams> {
  final UserRepository _userRepository;

  LogInWithEmailUseCase(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginParams params) async =>
      _userRepository.login(params.email, params.password);
}
