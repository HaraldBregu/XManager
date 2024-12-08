import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/data/datasources/local/network_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/repository/device_repository.dart';

class DeviceRepositoryImpl implements DeviceRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkDataSource networkDataSource;

  DeviceRepositoryImpl(
    this.remoteDataSource,
    this.networkDataSource,
  );

  @override
  Future<Either<Failure, List<DeviceEntity>>> getDevices() async {
    try {
      await networkDataSource.isConnected;
      final programs = await remoteDataSource.getDevices();
      return Right(programs);
    } on NetworkConnectionExeption catch (_) {
      return Left(NetworkFailure());
    }
  }
}
