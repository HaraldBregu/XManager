import 'package:equatable/equatable.dart';

class HomeEntity extends Equatable {
  final String profileMode;
  final bool hasDataAnalytics;
  final bool hasPrograms;
  final bool devices;

  const HomeEntity({
    required this.profileMode,
    required this.hasDataAnalytics,
    required this.hasPrograms,
    required this.devices,
  });

  @override
  List<Object> get props => [
        profileMode,
        hasDataAnalytics,
        hasPrograms,
        devices,
      ];
}
