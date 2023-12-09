import 'package:equatable/equatable.dart';

class DashboardProfileEntity extends Equatable {
  final String fullname;
  final String? description;

  const DashboardProfileEntity({
    required this.fullname,
    this.description,
  });

  @override
  List<Object?> get props => [
        fullname,
        description,
      ];
}
