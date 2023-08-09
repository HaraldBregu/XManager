import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/data/datasources/shared_preferences_datasource.dart';
import 'package:xmanager/src/core/data/models/app_model.dart';
import 'package:xmanager/src/core/domain/repository/app_repository.dart';
import 'package:xmanager/src/core/exeptions.dart';
import 'package:xmanager/src/core/failures.dart';

class AppRepositoryImpl implements AppRepository {
  final SharedPreferencesDataSourceImpl _sharedPreferencesDataSource;

  AppRepositoryImpl(this._sharedPreferencesDataSource);

  @override
  Future<Either<Failure, AppModel>> getApp() async {
    try {
      final app = await _sharedPreferencesDataSource.getApp();
      return Right(app);
    } on DatabaseExeption {
      return Left(DatabaseFailure());
    }
  }

  // @override
  // Future<Either<Failure, bool>> saveFullName(String fullname) async {
  //   try {
  //     final success =
  //       await _sharedPreferencesDataSource.setUserFullName(fullname);
  //     return Right(success);
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, UserEntity>> getUser() async {
  //   try {
  //     return Right(await _sharedPreferencesDataSource.getUser());
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, bool>> userAuthorised() async {
  //   try {
  //     final user = await _sharedPreferencesDataSource.getUser();
  //     return Right(user.fullname.isNotEmpty);
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, bool>> exitUser() async {
  //   try {
  //     final user = await _sharedPreferencesDataSource.clearUserFullName();
  //     return Right(user);
  //   } on DatabaseExeption {
  //     return Left(DatabaseFailure());
  //   }
  // }

}
