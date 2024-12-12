import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/entities/device_program_entity.dart';

abstract class UploaderEvent extends Equatable {
  const UploaderEvent();
}

class SelectProgram extends UploaderEvent {
  final DeviceProgramEntity program;
  const SelectProgram(this.program);

  @override
  List<Object?> get props => [program];
}

class SelectDevices extends UploaderEvent {
  final List<DeviceEntity> devices;
  const SelectDevices(this.devices);

  @override
  List<Object?> get props => [devices];
}

class SelectDevice extends UploaderEvent {
  final DeviceEntity device;
  const SelectDevice(this.device);

  @override
  List<Object?> get props => [device];
}

class StartUploading extends UploaderEvent {
  const StartUploading();

  @override
  List<Object?> get props => [];
}
