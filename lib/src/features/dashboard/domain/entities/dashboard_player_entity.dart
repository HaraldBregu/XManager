import 'package:equatable/equatable.dart';

class DashboardPlayerEntity extends Equatable {
  final int id;
  final String fullname;
  final DateTime birthdate;
  final double weight;
  final double height;
  final String role;
  final String nationality;

  const DashboardPlayerEntity({
    required this.id,
    required this.fullname,
    required this.birthdate,
    required this.weight,
    required this.height,
    required this.role,
    required this.nationality,
  });

  @override
  List<Object?> get props => [
    id,
    fullname,
    birthdate,
    weight,
    height,
    role,
    nationality,
  ];

}
