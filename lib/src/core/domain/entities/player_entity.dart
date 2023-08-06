import 'package:equatable/equatable.dart';

class PlayerEntity extends Equatable {
  final String fullname;
  final String birthdate;

  const PlayerEntity({
    required this.fullname,
    required this.birthdate,
  });

  @override
  List<Object?> get props => [
        fullname,
        birthdate,
      ];
}
