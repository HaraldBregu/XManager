import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();
}

class DashboardEventStart extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class DashboardProfileEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class DashboardProgramsEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class DashboardPlayerEvent extends DashboardEvent {
  @override
  List<Object?> get props => [];
}
