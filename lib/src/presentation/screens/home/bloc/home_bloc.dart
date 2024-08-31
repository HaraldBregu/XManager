import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/presentation/screens/home/bloc/home_event.dart';
import 'package:xmanager/src/presentation/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  // GetMyTrainingProgramListUsecase
  final BluetoothConnectPermissionsUseCase bleConnectPermissions;
  final BluetoothConnectUseCase bleConnect;
  final BleDisconnectDeviceUseCase bleDisconnect;
  final BleDeviceConnectedUseCase bleConnected;
  final BleDiscoverServicesUseCase bleDiscoverServices;
  final BleWriteUseCase bleWrite;

  HomeBloc({
    required this.bleConnectPermissions,
    required this.bleConnect,
    required this.bleDisconnect,
    required this.bleConnected,
    required this.bleDiscoverServices,
    required this.bleWrite,
  }) : super(const HomeInitialState()) {
    on<HomeStartEvent>(_onStartEvent);
    on<HomeUploadProgramToDeviceEvent>(_onUploadProgramEvent);
  }

  Future<void> _onStartEvent(
    HomeStartEvent event,
    Emitter<HomeState> emit,
  ) async {}

  Future<void> _onUploadProgramEvent(
    HomeUploadProgramToDeviceEvent event,
    Emitter<HomeState> emit,
  ) async {
    /*

    Future todo
    - Get device list from RemoteConfig to compare the current device

    - Read Selected Program

    - Read Device Pairs
    - Check if both are used?

    - Read Left Device data
    - Connect
    - Authenticate
    - Upload Program
    - Disconnect

    - Read Right Device data
    - Connect
    - Authenticate
    - Upload Program
    - Disconnect

    */
    // 5- Connect to device pairs
    // 6- Authenticate to current device
    // 7- Upload program to current device
    // 8- Disconnect
    // 9- Repeat for other devices

    final devicePairs = event.devicePairs;
    final program = event.program;
    print("carica programma");
  }
}
