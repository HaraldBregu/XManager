import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/platform/network_info.dart';
import 'package:xmanager/src/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/data/models/profile_model.dart';
import 'package:xmanager/src/domain/repository/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ProfileModel>> getCurrentProfile() async {
    networkInfo.isConnected;
    try {
      final result = await remoteDataSource.getCurrentProfile();
      return Right(result);
    } catch (e) {
      return Left(NoCurrentProfile());
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> saveProfile(String fullname) {
    throw UnimplementedError();
  }
}
