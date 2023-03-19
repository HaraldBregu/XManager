import 'package:objectbox/objectbox.dart';

@Entity()
class DeviceProgram {
  @Id()
  int id = 0;
  String title = "";
}

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
}
