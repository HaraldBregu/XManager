import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:xmanager/src/core/data/models/ble_device_model.dart';
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
  Future<bool> savePlayer(PlayerModel player) {
    throw UnimplementedError();
  }
}
