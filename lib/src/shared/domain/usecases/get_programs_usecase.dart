import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';
import 'package:xmanager/src/shared/domain/repository/program_repository.dart';

class GetProgramsUseCase
    implements UseCase<List<DeviceProgramEntity>, NoParams> {
  final ProgramRepository programRepository;

  GetProgramsUseCase(this.programRepository);

  @override
  Future<Either<Failure, List<DeviceProgramEntity>>> call(
          NoParams params) async =>
      programRepository.getPrograms();
}
