import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/player_entity.dart';
import 'package:xmanager/src/core/domain/repository/player_repository.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

class SavePlayerUseCase implements UseCase<bool, NoParams> {
  final PlayerRepository _playerRepository;

  SavePlayerUseCase(this._playerRepository);

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    throw UnimplementedError();
  }

  // @override
  // Future<DataState<bool>> call(int player) async {
  //   //return _playerRepository.savePlayer(player);
  // }
}
