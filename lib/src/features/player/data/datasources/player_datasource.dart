import '../../../../../data/models/objectbox_db/player.dart';
import '../models/player_model.dart';

abstract class PlayerDataSource {
  Future<PlayerModel>getPlayerModel(Player player);
}

class PlayerDataSourceImpl implements PlayerDataSource {

  @override
  Future<PlayerModel> getPlayerModel(Player player) async {
    return PlayerModel.fromPlayer(player);
  }

}