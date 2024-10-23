import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/shared/domain/entities/profile_entity.dart';
import 'package:xmanager/src/shared/domain/repository/profile_repository.dart';

class GetCurrentProfileUsecase implements UseCase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetCurrentProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async =>
      profileRepository.getCurrentProfile();
}
