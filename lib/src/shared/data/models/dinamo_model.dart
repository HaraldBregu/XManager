import 'dart:convert';
import 'package:xmanager/src/shared/domain/entities/dinamo_entity.dart';

class DinamoModel extends DinamoEntity {
  const DinamoModel({
    required super.leftBleMac,
    required super.rightBleMac,
  });

  DinamoModel copyWith({
    String? leftBleMac,
    String? rightBleMac,
  }) {
    return DinamoModel(
      leftBleMac: leftBleMac ?? "",
      rightBleMac: rightBleMac ?? "",
    );
  }

  factory DinamoModel.fromMap(Map<String, dynamic> map) {
    return DinamoModel(
      leftBleMac: map['leftBleMac'] as String,
      rightBleMac: map['rightBleMac'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'leftBleMac': leftBleMac,
      'rightBleMac': rightBleMac,
    };
  }
}
