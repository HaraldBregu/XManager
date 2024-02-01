import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/utils_repository.dart';

class PasswordStrengthPercUseCase implements BaseUseCase<double, String> {
  PasswordStrengthPercUseCase(this._utilsRepository);
  final UtilsRepository _utilsRepository;

  @override
  Future<double> call(String password) =>
      _utilsRepository.passwordStrengthPerc(password);
}
