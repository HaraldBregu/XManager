import '../../domain/entities/player_entity.dart';
import 'package:meta/meta.dart';

class PlayerModel extends PlayerEntity {

  const PlayerModel({
    required super.fullname,
    required super.role,
    required super.nationality,
    required super.birthdate,
    required super.weight,
    required super.height,
  });

  /*
  factory PlayerModel.fromPlayer(Player player) => PlayerModel(
      fullname: player.fullname,
      role: player.role ?? "",
      nationality: player.nationality ?? "",
      birthdate: player.birthdate.toString(),
      weight: player.weight.toString(),
      height: player.height.toString(),);*/
}
