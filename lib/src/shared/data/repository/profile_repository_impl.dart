import 'package:dartz/dartz.dart';

import '../../../core/error/failures.dart';
import '../../domain/repository/profile_repository.dart';
import '../datasources/local/network_datasource.dart';
import '../datasources/remote/remote_datasource.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkDataSource networkDataSource;

  ProfileRepositoryImpl({
    required this.remoteDataSource,
    required this.networkDataSource,
  });

  @override
  Future<Either<Failure, ProfileModel>> getCurrentProfile() async {
    networkDataSource.isConnected;
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
