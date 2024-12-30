import 'dart:math';

import 'package:flutter/material.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/theme_extension.dart';
import 'package:xmanager/src/shared/domain/entities/device_entity.dart';

const double kTotalSteps = 8;

enum UploaderStatus {
  idle(0.0),
  connecting(1.0 / kTotalSteps * 1),
  connected(1.0 / kTotalSteps * 2),
  servicesDiscovering(1.0 / kTotalSteps * 3),
  servicesDiscovered(1.0 / kTotalSteps * 4),
  authenticating(1.0 / kTotalSteps * 5),
  authenticated(1.0 / kTotalSteps * 6),
  dataUploading(1.0 / kTotalSteps * 7),
  dataUploaded(1.0 / kTotalSteps * 8);

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
    }
  }

  Color getProgressColor(BuildContext context) {
    final defaultColor = context.colorScheme.secondary;
    final errorColor = context.colorScheme.error;
    if (failure != null) return errorColor;

    return defaultColor;
  }
}
