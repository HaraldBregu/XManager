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

