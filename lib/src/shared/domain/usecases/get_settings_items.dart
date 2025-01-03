import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../entities/setttings_entity.dart';
import '../repository/settings_repository.dart';

abstract class GetSettingsItems {
  Future<Either<Failure, SettingsEntity>> execute();
}

class GetSettingsItemsImpl implements GetSettingsItems {
  final SettingsRepository _settingsRepository;

  GetSettingsItemsImpl(this._settingsRepository);

  @override
  Future<Either<Failure, SettingsEntity>> execute() {
    return _settingsRepository.getSettings();
  }
}
