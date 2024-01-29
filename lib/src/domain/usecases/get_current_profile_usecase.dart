import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/profile_entity.dart';
import 'package:xmanager/src/domain/repository/profile_repository.dart';

class GetCurrentProfileUsecase implements UseCase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetCurrentProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) {
    return profileRepository.getCurrentProfile();
  }
}
