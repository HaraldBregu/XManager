import '../../../../../data/models/models.dart';
import '../../../../core/error/exeptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/player_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/player_repository.dart';
import '../datasources/player_datasource.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerDataSource playerDataSource;

  PlayerRepositoryImpl(this.playerDataSource);

  @override
  Future<Either<Failure, PlayerEntity>> getPlayer(Player player) async {
    try {
      final res = await playerDataSource.getPlayerModel(player);
      return Right(res);
    } on ServerExeption {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, PlayerEntity>> savePlayer() {
    // TODO: implement savePlayer
    throw UnimplementedError();
  }

}