import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/domain/entities/training_program_entity.dart';

abstract class TrainingProgramRepository {
  Future<Either<Failure, List<TrainingProgramEntity>>>
      getMyTrainingProgramList();
}
