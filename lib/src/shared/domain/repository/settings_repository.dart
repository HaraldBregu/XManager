import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../entities/setttings_entity.dart';

abstract class SettingsRepository {
  Future<Either<Failure, SettingsEntity>> getSettings();
}
