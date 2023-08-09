import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/data/datasources/shared_preferences_datasource.dart';
import 'package:xmanager/src/core/domain/entities/user_entity.dart';
import 'package:xmanager/src/core/domain/repository/user_repository.dart';
import 'package:xmanager/src/core/exeptions.dart';
import 'package:xmanager/src/core/failures.dart';

class UserRepositoryImpl implements UserRepository {
  final SharedPreferencesDataSourceImpl _sharedPreferencesDataSource;

  UserRepositoryImpl(this._sharedPreferencesDataSource);

  @override
  Future<Either<Failure, UserEntity>> currentUser() async {
    try {
      return Right(await _sharedPreferencesDataSource.getUser());
    } on DatabaseExeption {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> exitUser() async {
    try {
      return Right(await _sharedPreferencesDataSource.clearUserFullName());
    } on DatabaseExeption {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveFullName(String fullname) {
    // TODO: implement saveFullName
    throw UnimplementedError();
  }
}
