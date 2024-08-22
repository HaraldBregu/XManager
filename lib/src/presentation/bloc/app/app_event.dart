abstract class AppEvent {
  const AppEvent();
}

class AppStartEvent extends AppEvent {}

class AppPermissionsStatusEvent extends AppEvent {}

class RequestLocationPermission extends AppEvent {}

class RequestBluetoothPermission extends AppEvent {}

class RequestBluetoothConnectPermission extends AppEvent {}

class RequestBluetoothScanPermission extends AppEvent {}

class GoToSettings extends AppEvent {}
