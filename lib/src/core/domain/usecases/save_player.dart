import 'package:xmanager/src/core/data_state.dart';
import 'package:xmanager/src/core/domain/entities/player_entity.dart';
import 'package:xmanager/src/core/domain/repository/player_repository.dart';
import 'package:xmanager/src/core/usecase.dart';

class SavePlayerUseCase implements UseCase<DataState<bool>, PlayerEntity> {
  final PlayerRepository _playerRepository;

  SavePlayerUseCase(this._playerRepository);

  @override
  Future<DataState<bool>> call(PlayerEntity player) {
    return _playerRepository.savePlayer(player);
  }
}
