import 'package:dartz/dartz.dart';
import '../../../../../data/models/objectbox_db/player.dart';
import '../../../../core/error/failures.dart';

abstract class TeamRepository {
  Future<Either<Failure, Player>>getAccount();
  Stream<Either<Failure, List<Player>>>getAllPlayers();
  Future<Either<Failure, int>>getPlayerCount();
}