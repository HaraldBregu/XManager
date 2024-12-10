import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/features/home/domain/entities/home_entity.dart';
import 'package:xmanager/src/features/home/domain/repositories/home_repository.dart';

class GetProgramsUseCase implements UseCase<HomeEntity, NoParams> {
  final HomeRepository _userRepository;

  GetProgramsUseCase(this._userRepository);

  @override
  Future<Either<Failure, HomeEntity>> call(NoParams noParams) async =>
      _userRepository.homeEntity;
}
