import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../../core/usecase.dart';
import '../entities/profile_entity.dart';
import '../repository/profile_repository.dart';

class GetCurrentProfileUsecase implements UseCase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetCurrentProfileUsecase(this.profileRepository);

  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async =>
      profileRepository.getCurrentProfile();
}
