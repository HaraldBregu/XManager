import 'package:xmanager/src/core/domain/entities/app_entity.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/resources/data_state.dart';
import 'package:xmanager/src/core/usecase/usecase.dart';

class GetAppUseCase implements UseCase<DataState<AppEntity>, void> {
  GetAppUseCase(this._userRepository);

  final AppRepository _userRepository;

  @override
  Future<DataState<AppEntity>> call(void params) {
    return _userRepository.getApp();
  }
}
