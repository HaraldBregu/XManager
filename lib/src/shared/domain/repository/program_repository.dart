import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

abstract class ProgramRepository {
  Future<Either<Failure, List<ProgramEntity>>> getPrograms();
}
