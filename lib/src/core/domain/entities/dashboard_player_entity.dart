import 'package:equatable/equatable.dart';

class DashboardPlayerEntity extends Equatable {
  final int id;
  final String fullname;

  const DashboardPlayerEntity({
    required this.id,
    required this.fullname,
  });

  @override
  List<Object?> get props => [
        id,
        fullname,
      ];
}
