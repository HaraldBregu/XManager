import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/authorised_user.dart';
import 'package:xmanager/src/core/domain/usecases/unlock_user.dart';
import 'package:xmanager/src/core/presentation/bloc/user/bloc.dart';
import 'package:xmanager/src/core/resources/data_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final AuthorizedUserUseCase authorisedUserUseCase;
  final UnlockUserUseCase unlockUserUseCase;

  UserBloc({
    required this.authorisedUserUseCase,
    required this.unlockUserUseCase,
  }) : super(const UserStateInitial()) {
    on<StartUserEvent>(onStartUserEvent);
    on<AccessUserEvent>(onAccessUserEvent);

    /*
    on<GetUserEvent>((event, emit) async {
      final dataState = await getUserUseCase.call();

      log('data example log');

      if (dataState is DataSuccess) {
        log('success:');
        if (dataState.data?.firstName != null) {
          log('has first name:');
          emit(UserAuthenticatedState(dataState.data!));
        } else {
          log('no first name');
          emit(UserUnAuthenticatedState());
        }
      } else {
        log('failure');
      }
    });

    on<SaveUserEvent>((event, emit) async {
      log('data example log');
      final dataState = await getUserUseCase.call();
    });
    */

/*
    on<SaveUserEvent>((userData, emit) async {
      final dataState = await getUserUseCase.call();

      log('data example log');

      if (dataState is DataSuccess) {
        log('success:');
        if (dataState.data?.firstName != null) {
          log('has first name:');
          emit(UserDataStateAuthenticated(dataState.data!));
        } else {
          log('no first name');
          emit(UserDataStateUnAuthenticated());
        }
      } else {
        log('failure');
      }
    });*/

    //on<UserDataGetNextEvent>(onGetUserDatanext);
  }

  Future<void> onStartUserEvent(
    StartUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final dataState = await authorisedUserUseCase.call({});

    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        emit(const UserStateAuthorized());
      } else {
        emit(const UserStateUnAuthorized());
      }
    }
  }

  Future<void> onAccessUserEvent(
    AccessUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserStateLoading());

    final dataState = await unlockUserUseCase.call(
      event.fullName,
    );

    if (dataState is DataSuccess) {
      if (dataState.data == true) {
        emit(const UserStateAuthorized());
      } else {
        emit(const UserStateUnAuthorized());
      }
    }
  }

  // void onGetUserDatanext(
  //   UserDataGetNextEvent userData,
  //   Emitter<UserState> emit,
  // ) async {
  //   final dataState = await getUserUseCase.call();

  //   if (dataState is DataSuccess && dataState.data != null) {
  //     log('success:');
  //     emit(UserDataStateNext("jim morrison"));
  //   } else {
  //     log('failure');
  //     emit(UserDataStateError());
  //   }
  // }
}
