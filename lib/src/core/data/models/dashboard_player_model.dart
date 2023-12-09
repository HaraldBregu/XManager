import 'package:json_annotation/json_annotation.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_player_entity.dart';

part 'dashboard_player_model.g.dart';

@JsonSerializable()
class DashboardPlayerModel extends DashboardPlayerEntity {
  const DashboardPlayerModel({required super.id, required super.fullname});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DashboardPlayerModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardPlayerModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DashboardPlayerModelToJson(this);
}
