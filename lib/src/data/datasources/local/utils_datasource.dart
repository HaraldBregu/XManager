import 'dart:ui';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

abstract class UtilsDataSource {
  Future<bool> validEmail(String email);
  Future<Color> passwordStrengthColor(String password);
  Future<double> passwordStrengthPerc(String password);
}

class UtilsDataSourceImpl implements UtilsDataSource {
  UtilsDataSourceImpl();

  @override
  Future<bool> validEmail(String email) async => EmailValidator.validate(email);

  @override
  Future<Color> passwordStrengthColor(String password) async =>
      PasswordStrength.calculate(text: password)?.statusColor ??
      Colors.transparent;

  @override
  Future<double> passwordStrengthPerc(String password) async =>
      PasswordStrength.calculate(text: password)?.widthPerc ?? 0.0;
}
