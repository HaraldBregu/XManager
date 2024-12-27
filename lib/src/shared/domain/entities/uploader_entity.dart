import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

class UploaderEntity {
  final ProgramEntity? program;
  final DeviceEntity device;
  final bool connected;
  final bool authenticated;
  final bool dataUploaded;
  final bool programDataSaved;
  final bool done;
  final double progress;
  final Failure? failure;

  const UploaderEntity({
    this.program,
    required this.device,
    this.connected = false,
    this.authenticated = false,
    this.dataUploaded = false,
    this.programDataSaved = false,
    this.progress = 0,
    this.done = false,
    this.failure,
  });

  UploaderEntity copyWith({
    ProgramEntity? program,
    DeviceEntity? device,
    bool? connected,
    bool? authenticated,
    bool? dataUploaded,
    bool? programDataSaved,
    double? progress,
    Failure? failure,
    bool? done,
  }) =>
      UploaderEntity(
        program: program ?? this.program,
        device: device ?? this.device,
        connected: connected ?? this.connected,
        authenticated: authenticated ?? this.authenticated,
        dataUploaded: dataUploaded ?? this.dataUploaded,
        programDataSaved: programDataSaved ?? this.programDataSaved,
        progress: progress ?? this.progress,
        failure: failure ?? this.failure,
        done: done ?? this.done,
      );
}
