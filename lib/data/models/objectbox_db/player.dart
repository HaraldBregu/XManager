import 'package:objectbox/objectbox.dart';


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
}