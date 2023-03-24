import 'package:json_annotation/json_annotation.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';

part 'dashboard_profile_model.g.dart';

@JsonSerializable()
class DashboardProfileModel extends DashboardProfileEntity {
  const DashboardProfileModel({required super.fullname});

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory DashboardProfileModel.fromJson(Map<String, dynamic> json) =>
      _$DashboardProfileModelFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$DashboardProfileModelToJson(this);
}
