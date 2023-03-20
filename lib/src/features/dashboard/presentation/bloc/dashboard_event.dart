import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class DashboardEvent extends Equatable {}

class DashboardEventFetched extends DashboardEvent {
  @override
  List<Object?> get props => [];
}

class DashboardEventTest extends DashboardEvent {
  final String name;
  DashboardEventTest(this.name);

  @override
  List<Object?> get props => [name];
}