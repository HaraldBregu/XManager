import '../../../../../data/models/models.dart';
import '../../domain/entities/player_entity.dart';
import 'package:meta/meta.dart';

class PlayerModel extends PlayerEntity {

  PlayerModel({
    required String fullname,
    required String role,
    required String nationality,
    required String birthdate,
    required String weight,
    required String height
  }) : super(
      fullname: fullname,
      role: role,
      nationality: nationality,
      birthdate: birthdate,
      weight: weight,
      height: height);

  factory PlayerModel.fromPlayer(Player player) => PlayerModel(
      fullname: player.fullname,
      role: player.role ?? "",
      nationality: player.nationality ?? "",
      birthdate: player.birthdate.toString(),
      weight: player.weight.toString(),
      height: player.height.toString(),);
}
