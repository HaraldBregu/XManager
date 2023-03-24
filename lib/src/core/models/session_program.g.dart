// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_program.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionProgram _$SessionProgramFromJson(Map<String, dynamic> json) =>
    SessionProgram()
      ..id = json['id'] as int
      ..title = json['title'] as String
      ..description = json['description'] as String
      ..startDate = json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String)
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..updatedAt = json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String)
      ..programs = (json['programs'] as List<dynamic>)
          .map((e) => DeviceProgram.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SessionProgramToJson(SessionProgram instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'startDate': instance.startDate?.toIso8601String(),
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'programs': instance.programs,
    };
