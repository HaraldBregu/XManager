import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/user_entity.dart';
import 'package:xmanager/src/core/domain/repository/user_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class AuthCurrentUseCase implements UseCase<UserEntity, NoParams> {
  AuthCurrentUseCase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) =>
      _userRepository.currentUser();
}
