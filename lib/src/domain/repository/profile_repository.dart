import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getCurrentProfile();
  Future<Either<Failure, ProfileEntity>> saveCurrentProfile(String fullname);
}
