import 'package:equatable/equatable.dart';
import 'package:xmanager/src/domain/entities/bluetooth_device_pairs_entity.dart';

class HomeState extends Equatable {

  const HomeState();
  @override
  List<Object?> get props => [];
}

class HomeInitialState extends HomeState {
  const HomeInitialState();
}

class HomeUploadingProgramToDevicePairsState extends HomeState {
  final BluetoothDevicePairsEntity devicePairs;

  const HomeUploadingProgramToDevicePairsState({
    required this.devicePairs,
  });
}
