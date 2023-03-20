import 'package:objectbox/objectbox.dart';

@Entity()
class DeviceProgram {
  @Id()
  int id = 0;
  String title = "";
}
