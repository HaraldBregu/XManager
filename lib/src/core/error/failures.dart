import 'package:equatable/equatable.dart';


abstract class Failure extends Equatable {
  const Failure() : super();
}

class ServerFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class DatabaseFailure extends Failure {
  @override
  List<Object?> get props => throw UnimplementedError();
}