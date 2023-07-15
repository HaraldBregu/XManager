import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';
import 'package:xmanager/src/core/data/models/device_program.dart';

part 'session_program.g.dart';

@JsonSerializable()
@Entity()
class SessionProgram {
  @Id()
  int id = 0;

  @Unique()
  String title = "";
  String description = "";

  @Property(type: PropertyType.date)
  DateTime? startDate;

  @Property(type: PropertyType.date)
  DateTime? createdAt;

  @Property(type: PropertyType.date)
  DateTime? updatedAt;

  List<DeviceProgram> programs = [];

  SessionProgram();

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory SessionProgram.fromJson(Map<String, dynamic> json) =>
      _$SessionProgramFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$SessionProgramToJson(this);
}
