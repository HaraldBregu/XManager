import 'package:equatable/equatable.dart';

class DashboardTrainingEntity extends Equatable {
  final String name;

  const DashboardTrainingEntity({
    required this.name,
  });

  @override
  List<Object?> get props => [
    name,
  ];

}