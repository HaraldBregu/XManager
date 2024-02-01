import 'package:flutter/material.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/repository/utils_repository.dart';

class PasswordStrengthColorUseCase implements BaseUseCase<Color, String> {
  PasswordStrengthColorUseCase(this._utilsRepository);
  final UtilsRepository _utilsRepository;

  @override
  Future<Color> call(String password) =>
      _utilsRepository.passwordStrengthColor(password);
}
