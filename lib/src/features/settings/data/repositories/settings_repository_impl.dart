import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/features/settings/data/datasources/local/settings_datasource.dart';
import 'package:xmanager/src/features/settings/domain/entities/setttings_entity.dart';
import 'package:xmanager/src/features/settings/domain/repositories/settings_repository.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource _settingsDataSource;

  SettingsRepositoryImpl(this._settingsDataSource);

  @override
  Future<Either<Failure, SettingsEntity>> getSettings() async {
    return Right(await _settingsDataSource.getSettings());
  }
}