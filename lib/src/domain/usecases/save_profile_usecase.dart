import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/domain/entities/profile_entity.dart';
import 'package:xmanager/src/domain/repository/profile_repository.dart';

class SaveProfileUsecase implements UseCase<ProfileEntity, ProfileParams> {
  final ProfileRepository profileRepository;

  SaveProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(ProfileParams params) async =>
      profileRepository.saveProfile(params.fullname);
}
