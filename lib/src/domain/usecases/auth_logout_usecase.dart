import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';

class LogOutUserUseCase implements BaseUseCase<bool, NoParams> {
  LogOutUserUseCase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<bool> call(NoParams noParams) => _userRepository.logOut();
}
