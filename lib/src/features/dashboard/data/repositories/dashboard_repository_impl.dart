import 'package:xmanager/src/features/dashboard/data/datasources/dashboard_local_data_source.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_training_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardLocalDataSource localDataSource;

  DashboardRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<DashboardProfileEntity> getProfile() {
    return localDataSource.getProfile();
  }

  @override
  Future<List<DashboardPlayerEntity>> getPlayers() {
    return localDataSource.getPlayers();
  }

  @override
  Future<DashboardTrainingEntity> getTraining() {
    return localDataSource.getTraining();
  }

}
