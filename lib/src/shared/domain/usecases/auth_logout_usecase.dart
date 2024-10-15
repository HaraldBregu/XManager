import '../../../core/usecase.dart';
import '../repository/user_repository.dart';

class LogOutUserUseCase implements BaseUseCase<void, NoParams> {
  LogOutUserUseCase(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<void> call(NoParams noParams) => _userRepository.logOut();
}
