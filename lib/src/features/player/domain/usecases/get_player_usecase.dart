import 'package:dartz/dartz.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../data/models/models.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/player_entity.dart';
import '../repositories/player_repository.dart';

class GetPlayerUseCase implements UseCase<PlayerEntity, NoParams> {
  final PlayerRepository repository;

  GetPlayerUseCase(this.repository);

  @override
  Future<Either<dynamic, PlayerEntity>> call(NoParams params) async => repository.getPlayer();

  //@override
  //Future<Either<Failure, PlayerEntity>> call() async => await repository.getPlayer();

}