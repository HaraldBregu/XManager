import 'package:equatable/equatable.dart';
import 'package:xmanager/src/domain/entities/bluetooth_device_pairs_entity.dart';
import 'package:xmanager/src/domain/entities/training_program_entity.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeStartEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class HomeUploadProgramToDeviceEvent extends HomeEvent {
  final BluetoothDevicePairsEntity devicePairs;
  final TrainingProgramEntity program;

  const HomeUploadProgramToDeviceEvent({
    required this.devicePairs,
    required this.program,
  });

  @override
  List<Object?> get props => [
        devicePairs,
        program,
      ];
}
