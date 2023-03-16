import 'package:equatable/equatable.dart';

class PlayerEntity extends Equatable {
  final String fullname;
  final String role;
  final String nationality;
  final String birthdate;
  final String weight;
  final String height;

  const PlayerEntity({
    required this.fullname,
    required this.role,
    required this.nationality,
    required this.birthdate,
    required this.weight,
    required this.height,
  });

  @override
  List<Object?> get props => [
    fullname,
    role,
    nationality,
    birthdate,
    weight,
    height];
}