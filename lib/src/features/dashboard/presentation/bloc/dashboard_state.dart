import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardStateInitial extends DashboardState {
  @override
  List<Object> get props => [];
}

class DashboardProfileStateError extends DashboardState {
  final String error;

  const DashboardProfileStateError(this.error);

  @override
  List<Object> get props => [error];
}

class DashboardProfileStateSuccess extends DashboardState {
  final String error;

  const DashboardProfileStateSuccess(this.error);

  @override
  List<Object> get props => [error];
}

class DashboardTestState extends DashboardState {
  final String message;

  const DashboardTestState(this.message);

  @override
  List<Object> get props => [message];
}
