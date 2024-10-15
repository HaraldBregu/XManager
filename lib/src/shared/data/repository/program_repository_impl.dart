import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/exeptions.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/data/datasources/local/network_datasource.dart';
import 'package:xmanager/src/shared/data/datasources/remote/remote_datasource.dart';
import 'package:xmanager/src/shared/data/models/program_model.dart';
import 'package:xmanager/src/shared/domain/repository/program_repository.dart';

class ProgramRepositoryImpl implements ProgramRepository {
  final RemoteDataSource remoteDataSource;
  final NetworkDataSource networkDataSource;

  ProgramRepositoryImpl(this.remoteDataSource, this.networkDataSource);

  @override
  Future<Either<Failure, List<ProgramModel>>> getPrograms() async {
    try {
      await networkDataSource.isConnected;
      final programs = await remoteDataSource.getPrograms();
      return Right(programs);
    } on NetworkConnectionExeption catch (_) {
      return Left(NetworkFailure());
    }
  }
}
