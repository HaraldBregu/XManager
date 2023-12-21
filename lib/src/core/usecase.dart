import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/domain/entities/bluetooth_device_entity.dart';
import 'package:xmanager/src/core/failures.dart';

abstract class BaseUseCase<Type, Params> {
  Future<Type> call(Params params);
}

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}


class BluetoothDeviceParams extends Equatable {
  final String name;
  final String uuid;

  const BluetoothDeviceParams({
    required this.name,
    required this.uuid,
  });

  @override
  List<Object?> get props => [
        name,
        uuid,
      ];
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
