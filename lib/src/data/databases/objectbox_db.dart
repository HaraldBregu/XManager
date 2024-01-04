import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:xmanager/src/data/databases/objectbox.g.dart';
import 'package:xmanager/src/data/models/models.dart';

class ObjectBox {
  late final Store store;
  late final Box<Player> playerBox;
  late final Box<SessionProgram> sessionProgramBox;
  late final Box<DeviceProgram> deviceProgramBox;

  ObjectBox._create(this.store) {
    playerBox = Box<Player>(store);
    sessionProgramBox = Box<SessionProgram>(store);
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-data"));
    return ObjectBox._create(store);
  }

  /// SessionProgram
  Query<SessionProgram> sessionProgramQuery() {
    return sessionProgramBox.query().build();
  }

  Future<List<SessionProgram>> getSessionPrograms() async {
    return sessionProgramQuery().find();
  }

  Stream<List<SessionProgram>> getStreamSessionPrograms() {
    final builder = sessionProgramBox.query()..order(SessionProgram_.id);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  /// Player
  Query<Player> playerQuery() {
    return playerBox.query().build();
  }

  Future<List<Player>> getPlayers() async {
    return playerQuery().find();
  }

  Stream<List<Player>> getStreamPlayers() {
    final builder = playerBox.query()..order(Player_.id);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }
}
