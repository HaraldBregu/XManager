import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/dashboard/data/datasources/local/dashboard_datasource.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_training_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDataSource localDataSource;

  DashboardRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<DashboardPlayerEntity>>> getPlayers() async {
    final List<DashboardPlayerEntity> entity =
        await localDataSource.getPlayers();
    return Right(entity);
  }

  @override
  Future<Either<Failure, DashboardProfileEntity>> getProfile() async {
    return Right(localDataSource.getProfile() as DashboardProfileEntity);
  }

  @override
  Future<Either<Failure, DashboardTrainingEntity>> getTraining() {
    throw Right({
      const DashboardTrainingEntity(name: ""),
    });
  }
}
