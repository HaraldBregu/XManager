import 'package:dartz/dartz.dart';
import '../../../core/error/failures.dart';
import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getCurrentProfile();
  Future<Either<Failure, ProfileEntity>> saveProfile(String fullname);
}
