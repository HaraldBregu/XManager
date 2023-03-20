import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_training_entity.dart';

abstract class DashboardRepository {
  Future<DashboardProfileEntity> getProfile();
  Future<DashboardTrainingEntity> getTraining();
  Future<List<DashboardPlayerEntity>> getPlayers();
}