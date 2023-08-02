import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/player/old_player/data/datasources/player_datasource.dart';
import 'package:xmanager/src/features/player/old_player/domain/entities/player_entity.dart';
import 'package:xmanager/src/features/player/old_player/domain/repositories/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerDataSource playerDataSource;

  PlayerRepositoryImpl(this.playerDataSource);
/*
  @override
  Future<Either<Failure, PlayerEntity>> getPlayer(Player player) async {
    try {
      final res = await playerDataSource.getPlayerModel(player);
      return Right(res);
    } on ServerExeption {
      return Left(DatabaseFailure());
    }
  }*/
}
