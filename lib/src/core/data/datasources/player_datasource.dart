import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/main.dart';
import 'package:xmanager/src/core/data/models/bluetooth_device_model.dart';
import 'package:xmanager/src/core/data/models/player.dart';
import 'package:xmanager/src/core/data/models/player_model.dart';

abstract class PlayerDataSource {
  Future<bool> savePlayer(PlayerModel player);
}

class PlayerDataSourceImpl implements PlayerDataSource {
//  final FlutterBluePlus flutterBluePlus;

  PlayerDataSourceImpl(/*{
    //required this.flutterBluePlus,
  }*/
      );

  @override
  Future<bool> savePlayer(PlayerModel player) async {
    //èèèii'p-àòàobjectBox.sessionProgramBox.put(object)
    //final result = objectBox.playerBox.put(Player.fromJson(player.toMap()));
    print("################");

    print(player);
    print("################");
    return true;
  }
}
