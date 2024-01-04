import 'package:xmanager/src/domain/repository/user_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class AuthLogOutUseCase implements BaseUseCase<bool, NoParams> {
  AuthLogOutUseCase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<bool> call(NoParams noParams) => _userRepository.logOut();
}
