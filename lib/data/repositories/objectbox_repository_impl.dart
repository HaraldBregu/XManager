import 'package:xmanager/data/models/objectbox_db/player.dart';
import 'package:xmanager/data/models/objectbox_db/session_program.dart';
import 'package:xmanager/domain/repositories/objectbox_repository.dart';


class ObjectBoxRepositoryImpl implements ObjectBoxRepository {

  @override
  Future<void> deletePlayer(Player player) {
    // TODO: implement deletePlayer
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSessionProgram(SessionProgram sessionProgram) {
    // TODO: implement deleteSessionProgram
    throw UnimplementedError();
  }

  @override
  Stream<List<Player>> getAllPlayers() {
    // TODO: implement getAllPlayers
    throw UnimplementedError();
  }

  @override
  Future<void> savePlayer(Player player) {
    // TODO: implement savePlayer
    throw UnimplementedError();
  }

  @override
  Future<void> saveSessionProgram(SessionProgram sessionProgram) {
    // TODO: implement saveSessionProgram
    throw UnimplementedError();
  }
}