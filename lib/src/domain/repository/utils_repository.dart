import 'dart:ui';

abstract class UtilsRepository {
  Future<bool> validEmail(String email);
  Future<Color> passwordStrengthColor(String password);
  Future<double> passwordStrengthPerc(String password);
}
