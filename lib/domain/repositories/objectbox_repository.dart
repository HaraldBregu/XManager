import 'package:xmanager/data/models/models.dart';

abstract class ObjectBoxRepository {

  Stream<List<Player>> getAllPlayers();

  Future<void> savePlayer(Player player);

  Future<void> deletePlayer(Player player);

  Future<void> saveSessionProgram(SessionProgram sessionProgram);

  Future<void> deleteSessionProgram(SessionProgram sessionProgram);

}