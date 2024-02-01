import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/data/datasources/local/network_datasource.dart';
import 'package:xmanager/src/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/data/models/user_model.dart';
import 'package:xmanager/src/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkDataSource networkDataSource;

  UserRepositoryImpl(this.remoteDataSource, this.networkDataSource);

  @override
  Future<Either<Failure, bool>> login(
    String email,
    String password,
  ) async {

    try {
      await networkDataSource.isConnected;
      await remoteDataSource.login(email, password);
    } on NetworkConnectionExeption catch (_) {
      return Left(NetworkFailure());
    } on LoginWithEmailException catch (e) {
      return Left(LoginFailure(e.errorType));
    } 

    return const Right(true);
  }

  @override
  Future<void> logOut() => remoteDataSource.logOut();

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
