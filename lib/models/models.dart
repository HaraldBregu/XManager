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
  String name = "";
  int? age;
  double? weight;
  double? height;
  String? role;

  Player();

  /*Player({
    this.role,
    this.name
  });*/

  /*
  @Property(type: PropertyType.date) // Store as int in milliseconds
  DateTime? date;

  @Transient() // Ignore this property, not stored in the database.
  int? computedProperty;*/
}

