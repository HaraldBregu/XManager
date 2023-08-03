import 'dart:ffi';

import 'package:equatable/equatable.dart';

abstract class BleEvent extends Equatable {
  const BleEvent();
  @override
  List<Object?> get props => [];
}

class BleStartScanEvent extends BleEvent {
  final int seconds;
  const BleStartScanEvent({required this.seconds});
}

class BleStopScanEvent extends BleEvent {}
