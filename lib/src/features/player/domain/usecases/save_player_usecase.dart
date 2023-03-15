import 'dart:ffi';

import 'package:dartz/dartz.dart';

import '../../../../../core/usecases/usecase.dart';
import '../../../../../data/models/objectbox_db/player.dart';
import '../../../../core/error/failures.dart';
import '../entities/player_entity.dart';
import '../repositories/player_repository.dart';

/*
class SavePlayerUseCase implements UseCase<PlayerEntity, Void> {
  final PlayerRepository repository;

  SavePlayerUseCase(this.repository);

  @override
  Future<Either<Failure, PlayerEntity>>? call(Void ) {
    return repository.savePlayer();
  }
}*/