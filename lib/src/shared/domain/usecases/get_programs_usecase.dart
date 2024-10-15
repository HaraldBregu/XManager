import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';
import 'package:xmanager/src/shared/domain/repository/program_repository.dart';

class GetProgramsUseCase implements UseCase<List<ProgramEntity>, NoParams> {
  final ProgramRepository programRepository;

  GetProgramsUseCase(this.programRepository);

  @override
  Future<Either<Failure, List<ProgramEntity>>> call(NoParams params) async =>
      programRepository.getPrograms();
}
