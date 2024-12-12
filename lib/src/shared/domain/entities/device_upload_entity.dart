import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

class DeviceUploadEntity {
  final DeviceEntity device;
  final bool connected;
  final bool authenticated;
  final bool programUploaded;
  final double progress;

  const DeviceUploadEntity({
    required this.device,
    this.connected = false,
    this.authenticated = false,
    this.programUploaded = false,
    this.progress = 0,
  });
}
