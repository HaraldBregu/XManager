import 'dart:convert';

import '../../domain/entities/profile_entity.dart';
import 'dinamo_model.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel({
    required super.fullname,
    required super.dinamo,
  });

  ProfileModel copyWith({
    String? fullname,
    DinamoModel? dinamo,
  }) {
    return ProfileModel(
      fullname: fullname ?? "",
      dinamo: dinamo ?? const DinamoModel(leftBleMac: '', rightBleMac: ''),
    );
  }

  factory ProfileModel.fromMap(Map<String, dynamic> map) {
    return ProfileModel(
      fullname: map['fullname'] as String,
      dinamo: DinamoModel.fromMap(map['dinamo'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() {
    final dinamoModel = dinamo as DinamoModel;
    final dinamoMap = dinamoModel.toMap();
    return {
      'fullname': fullname,
      'dinamo': dinamoMap,
    };
  }

  String toJson() => json.encode(toMap());
}
