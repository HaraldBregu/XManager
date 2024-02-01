import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/user_entity.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';

class GetCurrentUserUseCase implements UseCase<UserEntity?, NoParams> {
  final UserRepository _userRepository;

  GetCurrentUserUseCase(this._userRepository);

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async =>
      _userRepository.currentUser;
}
