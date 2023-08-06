import 'dart:convert';
import 'package:xmanager/src/core/domain/entities/player_entity.dart';

class PlayerModel extends PlayerEntity {
  const PlayerModel({
    required super.fullname,
    required super.birthdate,
  });

  PlayerModel copyWith({
    String? fullname,
    String? birthdate,
  }) {
    return PlayerModel(
      fullname: fullname ?? "",
      birthdate: birthdate ?? "",
    );
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      fullname: map['fullname'] as String,
      birthdate: map['birthdate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'birthdate': birthdate,
    };
  }
}
