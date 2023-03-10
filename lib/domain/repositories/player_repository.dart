import 'package:xmanager/data/models/objectbox_db/player.dart';

abstract class PlayerRepository {
  Stream<List<Player>> getAll();
}