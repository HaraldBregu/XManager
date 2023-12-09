import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_training_entity.dart';
import 'package:xmanager/src/core/failures.dart';

abstract class DashboardRepository {
  Future<Either<Failure, DashboardProfileEntity>> getProfile();
  Future<Either<Failure, DashboardTrainingEntity>> getTraining();
  Future<Either<Failure, List<DashboardPlayerEntity>>> getPlayers();
}
