import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/enums.dart';
import 'package:xmanager/src/core/error/failures.dart';
import 'package:xmanager/src/core/usecase.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home_event.dart';
import 'package:xmanager/src/features/home/presentation/bloc/home_state.dart';
import 'package:xmanager/src/shared/domain/usecases/ble_usecases.dart';
import 'package:xmanager/src/shared/domain/usecases/get_app_permissions.dart';
import 'package:xmanager/src/shared/domain/usecases/get_programs_usecase.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BluetoothConnectPermissionsUseCase bleConnectPermissions;
  final BluetoothConnectUseCase bleConnect;
  final BleDisconnectDeviceUseCase bleDisconnect;
  final BleDeviceConnectedUseCase bleConnected;
  final BleDiscoverServicesUseCase bleDiscoverServices;
  final BleWriteUseCase bleWrite;
  final GetProgramsUseCase getProgramsUseCase;

  HomeBloc({
    required this.bleConnectPermissions,
    required this.bleConnect,
    required this.bleDisconnect,
    required this.bleConnected,
    required this.bleDiscoverServices,
    required this.bleWrite,
    required this.getProgramsUseCase,
  }) : super(const HomeInitialState()) {
    on<InitialHomeEvent>(_onInitialHomeEvent);
    on<LoadHomeDataEvent>(_onLoadHomeDataEvent);

    on<HomeUploadProgramToDeviceEvent>(_onUploadProgramEvent);
    on<ShowProgramListEvent>(_onShowProgramListEvent);
    on<SelectProgramEvent>(_onSelectProgramEvent);
    on<UploadProgramEvent>(_onUploadProgram2Event);
  }

  Future<void> _onInitialHomeEvent(
    InitialHomeEvent event,
    Emitter<HomeState> emit,
  ) async {}

  Future<void> _onLoadHomeDataEvent(
    LoadHomeDataEvent event,
    Emitter<HomeState> emit,
  ) async {
    // usecase
    // homeDataUseCase.call
    // entity = HomeDataEntity
    // Profile
    // Data analysis = true/false
    // Programs count = true/false
    // Devices = list with embeded device_uploaded_program

    // 1. Show Loading state
    // GettingDataState

    // 2. Get data
    // DataLoadedState
  }

  Future<void> _onUploadProgramEvent(
    HomeUploadProgramToDeviceEvent event,
    Emitter<HomeState> emit,
  ) async {
    /*
    Future todo
    - Get supported device from Program
    {
      name: "Dinmao",
      version: 2.0.0,
      token: "fvnerkjnlerjnvòr"
    }

    - Get Authorization Token for selected devices

    - Read Selected Program
    - Get Program Left and Right 

    - Read Device Pairs
    
    if (Program.Left && Device.Left) 

    - Read Left Device Data
    - Connect (uuid of device)
    - Authenticate (uuid service and token authentication)
    - Upload Program (uuid service and send data)
    - Disconnect

    if (Program.Right && Device.Right) 
    - Read Right Device Data
    - Connect (uuid of device)
    - Authenticate (uuid service and token authentication)
    - Upload Program (uuid service and send data)
    - Disconnect
    */

    emit(const HomeInitialState());

    emit(const UploadingProgramToDevicePairsState());

    return;
    const deviceUuid = "E7:C8:DF:65:5B:4B";
    final connect = await bleConnect.call(deviceUuid);
    connect.fold(
      (left) {
        if (left is PermissionsDeniedFailure) {
          const state = AppPermissionsErrorState(
            permissionState: AppPermissionStatus.denied,
          );
          emit(state);
        } else if (left is PermissionsPermanentlyDeniedFailure) {
          const state = AppPermissionsErrorState(
            permissionState: AppPermissionStatus.permanentlyDenied,
          );
          emit(state);
        } else if (left is BluetoothConnectionFailure) {
          emit(const BluetoothErrorState());
        } else {
          emit(const BluetoothErrorState());
        }
      },
      (right) {
        print("right");
        //emit(const DeviceConnected());
      },
    );

    final services = await bleDiscoverServices.call(deviceUuid);

    emit(const BluetoothAuthenticationState());

    const serviceUuid = "";
    const characteristicUuid = "";
    await bleWrite.call(
      const BleWriteParams(
        deviceUuid: deviceUuid,
        serviceUuid: serviceUuid,
        characteristicUuid: characteristicUuid,
        value: [23],
        withoutResponse: true,
      ),
    );

    final devicePairs = event.devicePairs;
    final program = event.program;

    final uploadState = UploadingProgramToDevicePairsState();

    //emit(uploadState);

    print("carica programma");
  }

  Future<void> _onShowProgramListEvent(
    ShowProgramListEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeInitialState());

    final response = await getProgramsUseCase.call(NoParams());
    response.fold(
      (left) {},
      (right) {
        emit(ProgramListState(right));
      },
    );
  }

  Future<void> _onSelectProgramEvent(
    SelectProgramEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(StartUploadingState(event.program));
  }

  Future<void> _onUploadProgram2Event(
    UploadProgramEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(StartUploadingState(event.program));
    //emit(StartUploadingState(event.program, uploadingFirsDevice: true or false));
  }
}
