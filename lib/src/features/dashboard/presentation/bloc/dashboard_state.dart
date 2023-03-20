import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';

@immutable
abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardStateEmpty extends DashboardState {
  @override
  List<Object?> get props => [];
}

class DashboardStateData extends DashboardState {
  final DashboardProfileEntity data;
  const DashboardStateData(this.data);

  @override
  List<Object?> get props => [data];

}

class DashboardStatePlayers extends DashboardState {
  final List<DashboardPlayerEntity> players;
  const DashboardStatePlayers(this.players);

  @override
  List<Object?> get props => [players];

}
