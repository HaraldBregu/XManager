import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

class DeviceUploadEntity {
  final DeviceEntity device;
  final bool connected;
  final bool authenticated;
  final bool programUploaded;
  final double progress;
  final Failure? failure;
  
  const DeviceUploadEntity({
    required this.device,
    this.connected = false,
    this.authenticated = false,
    this.programUploaded = false,
    this.progress = 0,
    this.failure,
  });

  DeviceUploadEntity copyWith({
    DeviceEntity? device,
    bool? connected,
    bool? authenticated,
    double? progress,
    Failure? failure,
  }) {
    return DeviceUploadEntity(
      device: device ?? this.device,
      connected: connected ?? this.connected,
      authenticated: authenticated ?? this.authenticated,
      progress: progress ?? this.progress,
      failure: failure ?? this.failure,
    );
  }
}
