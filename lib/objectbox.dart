import 'package:xmanager/models/data_model.dart';
import 'objectbox.g.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;


class ObjectBox {
  late final Store store;
  late final Admin _admin;

  late final Box<Player>playerBox;
  late final Box<SessionProgram>sessionProgramBox;
  late final Box<DeviceProgram>deviceProgramBox;

  ObjectBox._create(this.store) {
    if (Admin.isAvailable()) {
      _admin = Admin(store);
    }

    playerBox = Box<Player>(store);
    sessionProgramBox = Box<SessionProgram>(store);
    //deviceProgramBox = Box<DeviceProgram>(store);
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

  Stream<List<SessionProgram>> getSessionPrograms() {
    final builder = sessionProgramBox.query()..order(SessionProgram_.id);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

}