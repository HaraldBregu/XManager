import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final bool locationGranted;
  final bool storageGranted;
  final bool bluetoothGranted;
  final bool bluetoothConnectGranted;
  final bool bluetoothScanGranted;

  const AppState({
    this.locationGranted = false,
    this.storageGranted = false,
    this.bluetoothGranted = false,
    this.bluetoothConnectGranted = false,
    this.bluetoothScanGranted = false,
  });

  AppState copyWith({
    bool? locationGranted,
    bool? storageGranted,
    bool? bluetoothGranted,
    bool? bluetoothConnectGranted,
    bool? bluetoothScanGranted,
  }) {
    return AppState(
      locationGranted: locationGranted ?? this.locationGranted,
      storageGranted: storageGranted ?? this.storageGranted,
      bluetoothGranted: bluetoothGranted ?? this.bluetoothGranted,
      bluetoothConnectGranted:
          bluetoothConnectGranted ?? this.bluetoothConnectGranted,
      bluetoothScanGranted: bluetoothScanGranted ?? this.bluetoothScanGranted,
    );
  }

  @override
  List<Object?> get props => [
        locationGranted,
        storageGranted,
        bluetoothGranted,
        bluetoothConnectGranted,
        bluetoothScanGranted,
      ];
}
