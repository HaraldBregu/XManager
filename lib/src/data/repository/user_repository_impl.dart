import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/data/models/user_model.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UserModel>> login(
    String email,
    String password,
  ) async {
    try {
      //final credential = await remoteDataSourceImpl.login(email, password);
      
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
      return Left(LoginError());
    }
  }

  @override
  Future<bool> logOut() => remoteDataSource.logOut();

  @override
  Future<Either<Failure, UserModel?>> get currentUser async {
    final credential = await remoteDataSource.currentUser;
    if (credential == null) {
      return Left(NoCurrentUser());
    } else {
      return Right(credential);
    }
  }
}
