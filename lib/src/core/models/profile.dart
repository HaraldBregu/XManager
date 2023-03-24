import 'package:json_annotation/json_annotation.dart';
import 'package:objectbox/objectbox.dart';

part 'profile.g.dart';

@JsonSerializable()
@Entity()
class Profile {
  @Id()
  int id = 0;
  String fullname = "";

  Profile();
  /// A necessary factory constructor for creating a new User instance
  /// from a map. Pass the map to the generated `_$UserFromJson()` constructor.
  /// The constructor is named after the source class, in this case, User.
  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$UserToJson`.
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
