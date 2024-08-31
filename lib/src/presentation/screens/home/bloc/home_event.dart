import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeStartEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeUploadProgramToDeviceEvent extends HomeEvent {
  // Device object
  final String device;
  // Program object
  final String program;

  const HomeUploadProgramToDeviceEvent({
    required this.device,
    required this.program,
  });

  @override
  List<Object?> get props => [
        device,
        program,
      ];
}
