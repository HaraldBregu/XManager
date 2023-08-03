import 'package:equatable/equatable.dart';

abstract class BleState extends Equatable {
  const BleState();

  @override
  List<Object?> get props => [];
}

class BleInitialState extends BleState {}

class BleScanningState extends BleState {}

class BleEndScanningState extends BleState {}
