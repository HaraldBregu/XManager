import 'package:equatable/equatable.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_player_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_profile_entity.dart';
import 'package:xmanager/src/features/dashboard/domain/entities/dashboard_training_entity.dart';

/*
enum DashboardStatus { initial, success, error, loading, selected }

extension CategoryStatusX on DashboardStatus {
  bool get isInitial => this == DashboardStatus.initial;
  bool get isSuccess => this == DashboardStatus.success;
  bool get isError => this == DashboardStatus.error;
  bool get isLoading => this == DashboardStatus.loading;
  bool get isSelected => this == DashboardStatus.selected;
}
*/

abstract class DashboardState extends Equatable {
  const DashboardState();
}

/// Initial STATE
class DashboardStateInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

/// Profile STATE SUCCESS
class DashboardProfileStateSuccess extends DashboardState {
  final DashboardProfileEntity profile;
  const DashboardProfileStateSuccess(
    this.profile,
  );
  @override
  List<Object> get props => [
        profile,
      ];
}

/// Profile STATE ERROR
class DashboardProfileStateError extends DashboardState {
  @override
  List<Object> get props => [];
}

/// Training STATE SUCCESS
class DashboardTrainingStateSuccess extends DashboardState {
  final DashboardTrainingEntity training;
  const DashboardTrainingStateSuccess(
    this.training,
  );
  @override
  List<Object> get props => [
        training,
      ];
}

/// Training STATE ERROR
class DashboardTrainingStateError extends DashboardState {
  @override
  List<Object> get props => [];
}

/// Players STATE SUCCESS
class DashboardPlayersStateSuccess extends DashboardState {
  final List<DashboardPlayerEntity> players;
  const DashboardPlayersStateSuccess(
    this.players,
  );
  @override
  List<Object> get props => [
        players,
      ];
}

/// Players STATE ERROR
class DashboardPlayersStateError extends DashboardState {
  @override
  List<Object> get props => [];
}
