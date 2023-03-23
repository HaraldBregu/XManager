import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();
}

class DashboardStateInitial extends DashboardState {
  @override
  List<Object> get props => [];
}