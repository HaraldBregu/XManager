import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/data/datasources/player_datasource.dart';
import 'package:xmanager/src/core/domain/repository/player_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  final PlayerDataSourceImpl _playerDataSourceImpl;

  const PlayerRepositoryImpl(this._playerDataSourceImpl);

  @override
  Future<Either<Failure, bool>> savePlayer(PlayerParams player) async {
    final d = player.fullname;

    //await _playerDataSourceImpl.savePlayer(player);
    //final result = await _playerDataSourceImpl.savePlayer(PlayerModel(fullname: "Test", birthdate: ""));

    //final d = PlayerModel(fullname: "fullname", birthdate: "birthdate");

    //final result = await _playerDataSourceImpl.savePlayer(PlayerEntity(fullname: "Test", birthdate: ""));

    return const Right(true);
  }
}
