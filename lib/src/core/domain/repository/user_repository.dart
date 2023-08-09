import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/user_entity.dart';
import 'package:xmanager/src/core/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> currentUser();
  Future<Either<Failure, bool>> saveFullName(String fullname);
  Future<Either<Failure, bool>> exitUser();
}
