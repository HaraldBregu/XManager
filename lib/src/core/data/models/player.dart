import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'player.g.dart';

@JsonSerializable()
@Entity()
class Player {
  @Id()
  int id = 0;

  @Unique()
  String fullname = "";

  @Property(type: PropertyType.date)
  DateTime? birthdate;

  double? weight;
  double? height;
  String? role;
  String? nationality;

  Player();

  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
