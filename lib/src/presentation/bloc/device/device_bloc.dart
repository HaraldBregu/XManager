import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/presentation/bloc/bloc.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(InitialDeviceState()) {
    on<StartScanDevicesEvent>(onStartScanDevicesEvent);
    //on<EnterUserEvent>(onEnterUserEvent);
    //on<ExitUserEvent>(onExitUserEvent);
  }

  Future<void> onStartScanDevicesEvent(
    StartScanDevicesEvent event,
    Emitter<DeviceState> emit,
  ) async {
    //final devices = await _getBleDevicesUseCase.call({});
  }
}
