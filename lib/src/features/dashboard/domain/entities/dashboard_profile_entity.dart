import 'package:equatable/equatable.dart';

class DashboardProfileEntity extends Equatable {
  final String fullname;

  const DashboardProfileEntity({
    required this.fullname,
  });

  @override
  List<Object?> get props => [
    fullname,
  ];

}