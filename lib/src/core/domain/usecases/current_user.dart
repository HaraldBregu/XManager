import 'package:xmanager/src/core/domain/entities/user_entity.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/resources/data_state.dart';
import 'package:xmanager/src/core/usecase/usecase.dart';

class CurrentUserUseCase implements UseCase<DataState<UserEntity>, void> {
  final AppRepository _userRepository;

  CurrentUserUseCase(this._userRepository);

  @override
  Future<DataState<UserEntity>> call(void params) {
    return _userRepository.getUser();
  }
}
