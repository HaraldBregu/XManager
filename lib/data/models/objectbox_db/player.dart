import 'package:objectbox/objectbox.dart';
import 'package:xmanager/domain/repositories/player_repository.dart';


@Entity()
class Player implements PlayerRepository {
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

  @override
  Stream<List<Player>> getAll() {
    //final builder = playerBox.query()..order(Player_.id);
    //return builder.watch(triggerImmediately: true).map((query) => query.find());
    throw UnimplementedError();
  }

}