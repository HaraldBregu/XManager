import 'package:xmanager/model/player_model.dart';
import 'model/player_model.dart';
import 'objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


class ObjectBox {
  late final Store store;
  late final Admin _admin;

  late final Box<Player>playerBox;
  ObjectBox._create(this.store) {
    if (Admin.isAvailable()) {
      _admin = Admin(store);
    }

    playerBox = Box<Player>(store);
  }


  /// Create an instance of ObjectBox to use throughout the app.
  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    // Future<Store> openStore() {...} is defined in the generated objectbox.g.dart
    final store = await openStore(directory: p.join(docsDir.path, "obx-data"));
    return ObjectBox._create(store);
  }

  Stream<List<Player>> getPlayers() {
    // Query for all events ordered by date.
    // https://docs.objectbox.io/queries
    final builder = playerBox.query()..order(Player_.id);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

}