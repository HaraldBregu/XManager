import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

enum UploaderStatus {
  idle(0.0),
  connecting(0.1),
  connected(0.2),
  servicesDiscovering(0.3),
  servicesDiscovered(0.4),
  authenticating(0.5),
  authenticated(0.6),
  dataUploading(0.7),
  dataUploaded(0.8),
  dataSaving(0.9),
  dataSaved(1.0);

  const UploaderStatus(this.value);
  final double value;
}

class UploaderEntity {
  final DeviceEntity device;
  final UploaderStatus state;
  final Failure? failure;

  const UploaderEntity({
    required this.device,
    this.state = UploaderStatus.idle,
    this.failure,
  });

  UploaderEntity copyWith({
    DeviceEntity? device,
    UploaderStatus? state,
    Failure? failure,
  }) =>
      UploaderEntity(
        device: device ?? this.device,
        state: state ?? this.state,
        failure: failure ?? this.failure,
      );

  String? get errorMessage {
    if (failure == null) return null;

    switch (state) {
      case UploaderStatus.connecting:
        return 'Failed to connect to device';
      case UploaderStatus.servicesDiscovering:
        return 'Failed to discover services';
      case UploaderStatus.authenticating:
        return 'Failed to authenticate';
      case UploaderStatus.dataUploading:
        return 'Failed to upload data';
      case UploaderStatus.dataSaving:
        return 'Failed to save data';
      default:
        return '';
    }
  }

  String get stateString {
    switch (state) {
      case UploaderStatus.idle:
        return 'Default';
      case UploaderStatus.connecting:
        return failure == null ? 'Connecting' : 'Failed to connect';
      case UploaderStatus.connected:
        return 'Connected';
      case UploaderStatus.servicesDiscovering:
        return 'Discovering services';
      case UploaderStatus.servicesDiscovered:
        return 'Services discovered';
      case UploaderStatus.authenticating:
        return 'Authenticating';
      case UploaderStatus.authenticated:
        return 'Authenticated';
      case UploaderStatus.dataUploading:
        return 'Uploading data';
      case UploaderStatus.dataUploaded:
        return 'Data uploaded';
      case UploaderStatus.dataSaving:
        return failure == null ? 'Saving data' : 'Failed to save data';
      case UploaderStatus.dataSaved:
        return 'Data saved';
    }
  }

  Color getProgressColor(BuildContext context) {
    final defaultColor = context.colorScheme.secondary;
    final errorColor = context.colorScheme.error;
    if (failure != null) return errorColor;

    return defaultColor;
  }
}
