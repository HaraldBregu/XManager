import 'package:objectbox/objectbox.dart';

@Entity()
class Profile {
  @Id()
  int id = 0;
  String fullname = "";
}