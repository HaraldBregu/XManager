import 'package:dartz/dartz.dart';
import '../../../../../core/service_locator.dart';
import '../../../../../data/models/models.dart';
import '../../../../core/error/failures.dart';
import '../repositories/team_repository.dart';

class GetTeamPlayers {

  Future<Either<Failure, int>>getPlayerCount() {
    return serviceLocator<TeamRepository>().getPlayerCount();
  }

  Stream<Either<Failure, List<Player>>> getAllPlayers() async* {
    serviceLocator<TeamRepository>().getAllPlayers();
    //final builder = objectBox.playerBox.query()..order(Player_.id);
    //return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}