import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecase.dart';
import '../entities/user_entity.dart';
import '../repository/user_repository.dart';

class GetCurrentUserUseCase implements UseCase<UserEntity?, NoParams> {
  final UserRepository _userRepository;

  GetCurrentUserUseCase(this._userRepository);

  @override
  Future<Either<Failure, UserEntity?>> call(NoParams params) async =>
      _userRepository.currentUser;
}
