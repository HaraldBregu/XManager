import 'dart:convert';
import 'package:xmanager/src/domain/entities/bluetooth_device_entity.dart';

class BluetoothDeviceModel extends BluetoothDeviceEntity {
  const BluetoothDeviceModel({
    required super.name,
    required super.uuid,
  });

  BluetoothDeviceModel copyWith({
    String? name,
    String? uuid,
  }) {
    return BluetoothDeviceModel(
      name: name ?? "",
      uuid: uuid ?? "",
    );
  }

  factory BluetoothDeviceModel.fromMap(Map<String, dynamic> map) {
    return BluetoothDeviceModel(
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
