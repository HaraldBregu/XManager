// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User()
  ..id = json['id'] as int
  ..fullname = json['fullname'] as String
  ..birthdate = json['birthdate'] == null
      ? null
      : DateTime.parse(json['birthdate'] as String)
  ..weight = (json['weight'] as num?)?.toDouble()
  ..height = (json['height'] as num?)?.toDouble()
  ..role = json['role'] as String?
  ..nationality = json['nationality'] as String?;

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'fullname': instance.fullname,
      'birthdate': instance.birthdate?.toIso8601String(),
      'weight': instance.weight,
      'height': instance.height,
      'role': instance.role,
      'nationality': instance.nationality,
    };
