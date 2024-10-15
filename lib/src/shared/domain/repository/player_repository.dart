import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../../../core/usecase.dart';

abstract class PlayerRepository {
  Future<Either<Failure, bool>> savePlayer(PlayerParams player);
}
