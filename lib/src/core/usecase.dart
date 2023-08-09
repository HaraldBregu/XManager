import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class PlayerParams extends Equatable {
  final String fullname;

  const PlayerParams({required this.fullname});

  @override
  List<Object?> get props => [fullname];
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}
