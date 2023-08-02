import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/device/presentation/bloc/bloc.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(InitialDeviceState()) {
    //on<InitialUserEvent>(onInitialUserEvent);
    //on<EnterUserEvent>(onEnterUserEvent);
    //on<ExitUserEvent>(onExitUserEvent);
  }
/*
  Future<void> onInitialUserEvent(
    InitialUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final currentUser = await currentUserUseCase.call({});
    final user = currentUser.data;

    final dataState = await authorisedUserUseCase.call({});
  


    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        var fullname = currentUser.data?.fullname ?? "";

        emit(UserAuthorizedState(
          fullname: fullname,
        ));
      } else {
        emit(UserUnAuthorizedState());
      }
    }
  }

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
