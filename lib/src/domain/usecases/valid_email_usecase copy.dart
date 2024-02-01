import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/utils_repository.dart';

class ValidEmailUseCase implements BaseUseCase<bool, String> {
  ValidEmailUseCase(this._utilsRepository);
  final UtilsRepository _utilsRepository;

  @override
  Future<bool> call(String email) => _utilsRepository.validEmail(email);
}
