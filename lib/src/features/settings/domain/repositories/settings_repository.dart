import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/features/settings/domain/entities/setttings_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, SettingsEntity>> getSettings();
}
