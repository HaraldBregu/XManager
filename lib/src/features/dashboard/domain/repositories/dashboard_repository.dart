import 'package:dartz/dartz.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';

abstract class DashboardRepository {
  DashboardEntity getDashboard();
  List<DashboardPlayerEntity> getPlayers();
  List<DashboardPlayerEntity> getStreamPlayers();
}