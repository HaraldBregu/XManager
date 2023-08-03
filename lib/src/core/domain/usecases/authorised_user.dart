import 'package:xmanager/src/core/data_state.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class AuthorizedUserUseCase implements UseCase<DataState<bool>, void> {
  AuthorizedUserUseCase(this._userRepository);

  final AppRepository _userRepository;

  @override
  Future<DataState<bool>> call(void params) {
    return _userRepository.userAuthorised();
  }
}
