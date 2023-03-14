import '../../../../../data/models/objectbox_db/player.dart';


class TeamEntity {
  final String userName;
  final int programCount;
  final List<Player> players;
  const TeamEntity(this.userName, this.programCount, this.players);
}