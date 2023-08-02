import 'dart:convert';
import 'package:xmanager/src/core/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.fullname,
    required super.description,
    required super.firstName,
    required super.lastName,
  });

  UserModel copyWith({
    String? fullname,
    String? description,
    String? firstName,
    String? lastName,
  }) {
    return UserModel(
      fullname: fullname ?? "",
      description: description ?? "",
      firstName: firstName ?? "",
      lastName: lastName ?? "",
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      fullname: map['fullname'] as String,
      description:
          map['description'] != null ? map['description'] as String : "",
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'description': description,
      'firstName': firstName,
      'lastName': lastName,
    };
  }
}
