import 'package:equatable/equatable.dart';
import 'package:xmanager/src/core/enums.dart';

class AppState extends Equatable {
  final AppPermissionStatus locationPermissionStatus;
  final AppPermissionStatus bluetoothPermissionStatus;
  final AppPermissionStatus bluetoothConnectPermissionStatus;
  final AppPermissionStatus bluetoothScanPermissionStatus;

  const AppState({
    this.locationPermissionStatus = AppPermissionStatus.denied,
    this.bluetoothPermissionStatus = AppPermissionStatus.denied,
    this.bluetoothConnectPermissionStatus = AppPermissionStatus.denied,
    this.bluetoothScanPermissionStatus = AppPermissionStatus.denied,
  });

  AppState copyWith({
    AppPermissionStatus? locationPermissionStatus,
    AppPermissionStatus? bluetoothPermissionStatus,
    AppPermissionStatus? bluetoothConnectPermissionStatus,
    AppPermissionStatus? bluetoothScanPermissionStatus,
  }) {
    return AppState(
      locationPermissionStatus:
          locationPermissionStatus ?? this.locationPermissionStatus,
      bluetoothPermissionStatus:
          bluetoothPermissionStatus ?? this.bluetoothPermissionStatus,
      bluetoothConnectPermissionStatus: bluetoothConnectPermissionStatus ??
          this.bluetoothConnectPermissionStatus,
      bluetoothScanPermissionStatus:
          bluetoothScanPermissionStatus ?? this.bluetoothScanPermissionStatus,     
    );
  }

  @override
  List<Object?> get props => [
        locationPermissionStatus,
        bluetoothPermissionStatus,
        bluetoothConnectPermissionStatus,
        bluetoothScanPermissionStatus,
      ];
}
