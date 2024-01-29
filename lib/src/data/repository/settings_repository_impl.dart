import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/data/datasources/local/settings_datasource.dart';
import 'package:xmanager/src/domain/entities/setttings_entity.dart';
import 'package:xmanager/src/domain/repository/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource _settingsDataSource;

  SettingsRepositoryImpl(this._settingsDataSource);

  @override
  Future<Either<Failure, SettingsEntity>> getSettings() async {
    return Right(await _settingsDataSource.getSettings());
  }
}
