import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/presentation/bloc/app/bloc.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc(super.initialState);
  /*
  final GetUserUseCase getUserUseCase;

  AuthBloc({required this.getUserUseCase}) : super(UserDataStateLoading()) {
    on<UserDataGetEvent>(onGetUserData);
    on<UserDataGetNextEvent>(onGetUserDatanext);
  }

  void onGetUserData(
    UserDataGetEvent userData,
    Emitter<UserDataState> emit,
  ) async {
    final dataState = await getUserUseCase.call();

    log('data example log');

    if (dataState is DataSuccess && dataState.data != null) {
      log('success:');
      log(dataState.data!.name);
      emit(UserDataStateDone(dataState.data!));
    } else {
      log('failure');
      emit(UserDataStateError());
    }
  }

  void onGetUserDatanext(
    UserDataGetNextEvent userData,
    Emitter<UserDataState> emit,
  ) async {
    final dataState = await getUserUseCase.call();

    if (dataState is DataSuccess && dataState.data != null) {
      log('success:');
      emit(UserDataStateNext("jim morrison"));
    } else {
      log('failure');
      emit(UserDataStateError());
    }
  }
  */
}
