import 'package:flutter/material.dart';

import '../../../core/usecase.dart';
import '../repository/utils_repository.dart';

class PasswordStrengthColorUseCase implements BaseUseCase<Color, String> {
  PasswordStrengthColorUseCase(this._utilsRepository);
  final UtilsRepository _utilsRepository;

  @override
  Future<Color> call(String password) =>
      _utilsRepository.passwordStrengthColor(password);
}
