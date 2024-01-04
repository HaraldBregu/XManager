import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/failures.dart';
import 'package:xmanager/src/core/usecase.dart';

abstract class PlayerRepository {
  Future<Either<Failure, bool>> savePlayer(PlayerParams player);
}
