import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'enums.dart';
import 'error/failures.dart';

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

class PermissionsParams extends Equatable {
  final bool request;
  const PermissionsParams({
    this.request = false,
  });

  @override
  List<Object?> get props => [request];
}

class ProfileParams extends Equatable {
  final String fullname;

  const ProfileParams({
    required this.fullname,
  });

  @override
  List<Object?> get props => [fullname];
}

class DeviceParams extends Equatable {
  final DeviceType type;
  final String version;
  final String name;

  const DeviceParams({
    required this.type,
    required this.version,
    required this.name,
  });

  @override
  List<Object?> get props => [
        type,
        version,
        name,
      ];
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

class BleParams extends Equatable {
  final String deviceUuid;
  final String serviceUuid;
  final String characteristicUuid;

  const BleParams({
    this.deviceUuid = '',
    this.serviceUuid = '',
    this.characteristicUuid = '',
  });

  BleParams copyWith({
    String? deviceUuid,
    String? serviceUuid,
    String? characteristicUuid,
  }) =>
      BleParams(
        deviceUuid: deviceUuid ?? this.deviceUuid,
        serviceUuid: serviceUuid ?? this.serviceUuid,
        characteristicUuid: characteristicUuid ?? this.characteristicUuid,
      );

  @override
  List<Object?> get props => [
        deviceUuid,
        serviceUuid,
        characteristicUuid,
      ];
}

class BleReadParams extends BleParams {
  const BleReadParams({
    required super.deviceUuid,
    required super.serviceUuid,
    required super.characteristicUuid,
  });

  @override
  List<Object?> get props => [];
}

class BleWriteParams extends BleParams {
  final List<int> value;
  final bool withoutResponse;

  const BleWriteParams({
    required super.deviceUuid,
    required super.serviceUuid,
    required super.characteristicUuid,
    required this.value,
    required this.withoutResponse,
  });

  @override
  List<Object?> get props => [
        value,
        withoutResponse,
      ];
}

class BleSetNotificationParams extends BleParams {
  final bool enable;

  const BleSetNotificationParams({
    required super.deviceUuid,
    required super.serviceUuid,
    required super.characteristicUuid,
    required this.enable,
  });

  @override
  List<Object?> get props => [
        enable,
      ];
}

class BleScanParams extends Equatable {
  final int seconds;
  final List<String>? services;

  const BleScanParams({
    required this.seconds,
    required this.services,
  });

  @override
  List<Object?> get props => [
        seconds,
        services,
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
