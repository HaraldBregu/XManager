import 'package:xmanager/src/core/data_state.dart';
import 'package:xmanager/src/core/domain/entities/player_entity.dart';

abstract class PlayerRepository {
  Future<DataState<bool>> savePlayer(PlayerEntity player);
}
