import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/domain/usecases/current_user.dart';
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

/*

  Future<void> onEnterUserEvent(
    EnterUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(LoadingUserState());

    final dataState = await unlockUserUseCase.call(
      event.fullName,
    );

    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        emit(const UserAuthorizedState(fullname: "something"));
      } else {
        emit(UserUnAuthorizedState());
      }
    }
  }

  Future<void> onExitUserEvent(
    ExitUserEvent event,
    Emitter<UserState> emit,
  ) async {

    if (state is UserAuthorizedState) {
      final dataState = await exitUserUseCase.call({});
      if (dataState is DataSuccess) {
        if (dataState.data == true) {
          emit(UserUnAuthorizedState());
        } else {
          emit(const UserAuthorizedState(fullname: "something"));
        }
      }
    }
  }
  */
}
