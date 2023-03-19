import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:xmanager/src/data/models/objectbox_models.dart';

import 'objectbox.g.dart';

class ObjectBox {
  late final Store store;
  late final Box<Player>playerBox;
  late final Box<SessionProgram>sessionProgramBox;
  late final Box<DeviceProgram>deviceProgramBox;

  ObjectBox._create(this.store) {
    playerBox = Box<Player>(store);
    sessionProgramBox = Box<SessionProgram>(store);
  }

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store = await openStore(directory: p.join(docsDir.path, "obx-data"));
    return ObjectBox._create(store);
  }

  Stream<List<Player>> getPlayers() {
    final builder = playerBox.query()..order(Player_.id);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

  Stream<List<SessionProgram>> getSessionPrograms() {
    final builder = sessionProgramBox.query()..order(SessionProgram_.id);
    return builder.watch(triggerImmediately: true).map((query) => query.find());
  }

}
