import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/dashboard/data/datasources/local/dashboard_datasource.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_training_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';

class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardDataSource _localDataSource;

  DashboardRepositoryImpl(this._localDataSource);

  @override
  Future<Either<Failure, List<DashboardPlayerEntity>>> getPlayers() async {
    try {
      final List<DashboardPlayerEntity> entity =
          await _localDataSource.getPlayers();
      return Right(entity);
    } on DatabaseExeption {
      return Left(DatabaseFailure as Failure);
    }
  }

  @override
  Future<Either<Failure, DashboardProfileEntity>> getProfile() async {
    try {
      return Right(await _localDataSource.getProfile());
    } on DatabaseExeption {
      return Left(DatabaseFailure as Failure);
    }
  }

  @override
  Future<Either<Failure, DashboardTrainingEntity>> getTraining() async {
    try {
      return Right(await _localDataSource.getTraining());
    } on DatabaseExeption {
      return Left(DatabaseFailure as Failure);
    }
  }
}
