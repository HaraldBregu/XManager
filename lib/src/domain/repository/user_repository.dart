import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> login(String email, String password);
  Future<bool> logOut();
  Future<Either<Failure, UserEntity>> currentUser();
  Future<Either<Failure, bool>> saveFullName(String fullname);
  Future<Either<Failure, bool>> exitUser();
}
