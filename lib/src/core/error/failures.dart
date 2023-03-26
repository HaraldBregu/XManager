import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/error/exeptions.dart';

abstract class Failure extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {}

class CacheFailure extends Failure {}

class DatabaseFailure extends Failure {}
