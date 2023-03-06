import 'package:objectbox/objectbox.dart';


/*
* Ruolo*
Allenatore
Direttore Sportivo
Presidente
Osservatore
Calciatore
Altro
* */

@Entity()
class Player {
  @Id()
  int id = 0;
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

@Entity()
class DeviceProgram {
  @Id()
  int id = 0;

  String title = "";
}