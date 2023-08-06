import 'package:xmanager/src/core/data_state.dart';
import 'package:xmanager/src/core/domain/entities/player_entity.dart';
import 'package:xmanager/src/core/domain/repository/player_repository.dart';

class PlayerRepositoryImpl implements PlayerRepository {
  @override
  Future<DataState<bool>> savePlayer(PlayerEntity player) {
    throw UnimplementedError();
  }
}
