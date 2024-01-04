import 'package:dartz/dartz.dart';
import 'package:xmanager/src/data/datasources/local/shared_preferences_datasource.dart';
import 'package:xmanager/src/data/datasources/remote/remote_datasource_impl.dart';
import 'package:xmanager/src/data/models/user_model.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';
import 'package:xmanager/src/core/exeptions.dart';
import 'package:xmanager/src/core/failures.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSourceImpl remoteDataSourceImpl;
  final SharedPreferencesDataSourceImpl sharedPreferencesDataSource;

  UserRepositoryImpl({
    required this.remoteDataSourceImpl,
    required this.sharedPreferencesDataSource,
  });

/*
  @override
  Future<Either<Failure, UserEntity>> currentUser() async {
    try {
      return Right(await sharedPreferencesDataSource.getUser());
    } on DatabaseExeption {
      return Left(DatabaseFailure());
    }
  }*/

  @override
  Future<Either<Failure, bool>> exitUser() async {
    try {
      return Right(await sharedPreferencesDataSource.clearUserFullName());
    } on DatabaseExeption {
      return Left(DatabaseFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> saveFullName(String fullname) {
    // TODO: implement saveFullName
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      final credential = await remoteDataSourceImpl.login(email, password);

      return const Right(
        UserModel(
          email: "dkjnv",
          // firstName: "",
          // lastName: "",
          // fullname: "",
          // description: "",
        ),
      );
    } on DatabaseExeption {
      return Left(LoginFailure());
    }
  }

  @override
  Future<bool> logOut() => remoteDataSourceImpl.logOut();

  @override
  Future<Either<Failure, UserModel>> currentUser() async {
    try {
      final credential = await remoteDataSourceImpl.currentUser;
      return Right(credential!);
    } on ServerExeption {
      return Left(CurrentUserFailure());
    }
  }
}
