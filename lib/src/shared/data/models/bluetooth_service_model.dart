import 'dart:convert';
import 'package:xmanager/src/shared/domain/entities/bluetooth_service_entity.dart';

class BluetoothServiceModel extends BluetoothServiceEntity {
  const BluetoothServiceModel({
    required super.remoteId,
    required super.serviceUuid,
    required super.isPrimary,
    required super.characteristics,
    required super.includedServices,
  });

  BluetoothServiceModel copyWith({
    String? remoteId,
    String? serviceUuid,
    bool? isPrimary,
    List<BluetoothCharacteristicModel>? characteristics,
    List<BluetoothServiceModel>? includedServices,
  }) {
    return BluetoothServiceModel(
      remoteId: remoteId ?? this.remoteId,
      serviceUuid: serviceUuid ?? this.serviceUuid,
      isPrimary: isPrimary ?? this.isPrimary,
      characteristics: characteristics ?? this.characteristics,
      includedServices: includedServices ?? this.includedServices,
    );
  }

  factory BluetoothServiceModel.fromMap(Map<String, dynamic> map) {
    return BluetoothServiceModel(
      remoteId: map['remoteId'] as String,
      serviceUuid: map['serviceUuid'] as String,
      isPrimary: map['isPrimary'] as bool,
      characteristics:
          map['characteristics'] as List<BluetoothCharacteristicModel>,
      includedServices: map['includedServices'] as List<BluetoothServiceModel>,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'remoteId': remoteId,
      'serviceUuid': serviceUuid,
      'isPrimary': isPrimary,
      'characteristics': characteristics,
      'includedServices': includedServices,
    };
  }
}

class BluetoothCharacteristicModel extends BluetoothCharacteristicEntity {
  const BluetoothCharacteristicModel({
    required super.characteristicUuid,
    required super.descriptors,
  });
}

class BluetoothDescriptorModel extends BluetoothDescriptorEntity {
  const BluetoothDescriptorModel({
    required super.characteristicUuid,
    required super.descriptorUuid,
  });
}
