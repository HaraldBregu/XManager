import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/user_entity.dart';
import 'package:xmanager/src/core/domain/repository/user_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class CurrentUserUseCase implements UseCase<UserEntity, NoParams> {
  final UserRepository _userRepository;

  CurrentUserUseCase(this._userRepository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return _userRepository.currentUser();
  }
}
