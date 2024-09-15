// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceModel _$DeviceModelFromJson(Map<String, dynamic> json) => DeviceModel(
      type: $enumDecode(_$DeviceTypeEnumMap, json['type']),
      position: $enumDecode(_$DevicePositionEnumMap, json['position']),
      name: json['name'] as String,
      version: json['version'] as String,
      macAddress: json['macAddress'] as String,
      programTitle: json['programTitle'] as String,
      programData: json['programData'] as String,
      programCreatedDate: json['programCreatedDate'] as String,
    );

Map<String, dynamic> _$DeviceModelToJson(DeviceModel instance) =>
    <String, dynamic>{
      'type': _$DeviceTypeEnumMap[instance.type]!,
      'position': _$DevicePositionEnumMap[instance.position]!,
      'name': instance.name,
      'version': instance.version,
      'macAddress': instance.macAddress,
      'programTitle': instance.programTitle,
      'programData': instance.programData,
      'programCreatedDate': instance.programCreatedDate,
    };

const _$DeviceTypeEnumMap = {
  DeviceType.none: 'none',
  DeviceType.dinamo: 'dinamo',
};

const _$DevicePositionEnumMap = {
  DevicePosition.none: 'none',
  DevicePosition.dinamoLeft: 'dinamoLeft',
  DevicePosition.dinamoRight: 'dinamoRight',
  DevicePosition.dinamoLeftRight: 'dinamoLeftRight',
};
