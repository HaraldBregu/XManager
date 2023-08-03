import 'dart:convert';
import 'package:xmanager/src/core/domain/entities/ble_device_entity.dart';

class BleDeviceModel extends BleDeviceEntity {
  const BleDeviceModel({
    required super.name,
    required super.uuid,
  });

  BleDeviceModel copyWith({
    String? name,
    String? uuid,
  }) {
    return BleDeviceModel(
      name: name ?? "",
      uuid: uuid ?? "",
    );
  }

  factory BleDeviceModel.fromMap(Map<String, dynamic> map) {
    return BleDeviceModel(
      name: map['name'] as String,
      uuid: map['uuid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uuid': uuid,
    };
  }
}
