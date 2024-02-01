import 'dart:ui';

import 'package:xmanager/src/data/datasources/local/utils_datasource.dart';
import 'package:xmanager/src/domain/repository/utils_repository.dart';

class UtilsRepositoryImpl implements UtilsRepository {
  final UtilsDataSource utilsDataSource;

  UtilsRepositoryImpl(this.utilsDataSource);

  @override
  Future<bool> validEmail(String email) => utilsDataSource.validEmail(email);

  @override
  Future<double> passwordStrengthPerc(String password) =>
      utilsDataSource.passwordStrengthPerc(password);

  @override
  Future<Color> passwordStrengthColor(String password) =>
      utilsDataSource.passwordStrengthColor(password);
}
