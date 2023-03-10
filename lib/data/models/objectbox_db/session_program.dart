import 'package:objectbox/objectbox.dart';
import 'package:xmanager/data/models/objectbox_db/device_program.dart';


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
