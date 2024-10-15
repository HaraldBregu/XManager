import 'dart:convert';
import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.email,
  });

  UserModel copyWith({
    String? email,
  }) {
    return UserModel(
      email: email ?? "",
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }
}
