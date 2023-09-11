import 'package:equatable/equatable.dart';

class BluetoothServiceEntity extends Equatable {
  final String remoteId;
  final String serviceUuid;
  final bool isPrimary;
  final List<BluetoothCharacteristicEntity> characteristics;
  final List<BluetoothServiceEntity> includedServices;

  const BluetoothServiceEntity({
    required this.remoteId,
    required this.serviceUuid,
    required this.isPrimary,
    required this.characteristics,
    required this.includedServices,
  });

  @override
  List<Object> get props => [
        remoteId,
        serviceUuid,
        isPrimary,
        characteristics,
        includedServices,
      ];
}

class BluetoothCharacteristicEntity extends Equatable {
  final String characteristicUuid;
  final List<BluetoothDescriptorEntity> descriptors;

  const BluetoothCharacteristicEntity({
    required this.characteristicUuid,
    required this.descriptors,
  });

  @override
  List<Object?> get props => [characteristicUuid, descriptors];
}

class BluetoothDescriptorEntity extends Equatable {
  final String characteristicUuid;
  final String descriptorUuid;

  const BluetoothDescriptorEntity({
    required this.characteristicUuid,
    required this.descriptorUuid,
  });

  @override
  List<Object?> get props => [characteristicUuid, descriptorUuid];
}
