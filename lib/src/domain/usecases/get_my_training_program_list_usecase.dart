import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/training_program_entity.dart';
import 'package:xmanager/src/domain/repository/training_program_repository.dart';

class GetMyTrainingProgramListUsecase
    implements UseCase<List<TrainingProgramEntity>, NoParams> {
  final TrainingProgramRepository trainingProgramRepository;

  GetMyTrainingProgramListUsecase(this.trainingProgramRepository);

  @override
  Future<Either<Failure, List<TrainingProgramEntity>>> call(
          NoParams params) async =>
      trainingProgramRepository.getMyTrainingProgramList();
}
