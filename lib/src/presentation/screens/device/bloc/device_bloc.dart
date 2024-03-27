import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_event.dart';
import 'package:xmanager/src/presentation/screens/device/bloc/device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(InitialDeviceState());
}
