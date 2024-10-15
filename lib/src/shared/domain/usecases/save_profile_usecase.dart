import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase.dart';
import '../entities/profile_entity.dart';
import '../repository/profile_repository.dart';

class SaveProfileUsecase implements UseCase<ProfileEntity, ProfileParams> {
  final ProfileRepository profileRepository;

  SaveProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(ProfileParams params) async =>
      profileRepository.saveProfile(params.fullname);
}
