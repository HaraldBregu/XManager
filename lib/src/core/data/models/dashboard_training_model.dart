import 'package:json_annotation/json_annotation.dart';
import 'package:xmanager/src/core/domain/entities/dashboard_training_entity.dart';

part 'dashboard_training_model.g.dart';

@JsonSerializable()
class DashboardTrainingModel extends DashboardTrainingEntity {
  const DashboardTrainingModel({required super.name});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DashboardTrainingModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardTrainingModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DashboardTrainingModelToJson(this);
}
