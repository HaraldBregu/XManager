import 'package:xmanager/src/core/data_state.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class UnlockUserUseCase implements UseCase<DataState<bool>, String> {
  final AppRepository _userRepository;

  UnlockUserUseCase(this._userRepository);

  @override
  Future<DataState<bool>> call(String params) {
    return _userRepository.saveFullName(params);
  }
}
