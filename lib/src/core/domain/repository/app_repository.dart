import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/domain/entities/app_entity.dart';
import 'package:xmanager/src/core/failures.dart';

abstract class AppRepository {
  Future<Either<Failure, AppEntity>> getApp();
}
