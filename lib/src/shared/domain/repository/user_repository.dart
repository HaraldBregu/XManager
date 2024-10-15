import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, bool>> login(
    String email,
    String password,
  );
  Future<void> logOut();
  Future<Either<Failure, UserEntity?>> get currentUser;
}
