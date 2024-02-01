import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';

class LogOutUserUseCase implements BaseUseCase<void, NoParams> {
  LogOutUserUseCase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<void> call(NoParams noParams) => _userRepository.logOut();
}
