import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_players.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_profile.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_training.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardProfile _getDashboardProfile;
  final GetDashboardTraining _getDashboardTraining;
  final GetDashboardPlayers _getDashboardPlayers;

  DashboardBloc(this._getDashboardProfile, this._getDashboardTraining,
      this._getDashboardPlayers)
      : super(DashboardStateInitial()) {
    on<DashboardEventStart>((event, emit) async {
      final result = await _getDashboardProfile.execute();
      result.fold(
        (failure) {
          emit(DashboardProfileStateError());
        },
        (data) {
          emit(DashboardProfileStateSuccess(data));
        },
      );
/*
      final resultTraining = await _getDashboardTraining.execute();
      resultTraining.fold(
        (failure) {
          emit(DashboardTrainingStateError());
        },
        (data) {
          emit(DashboardTrainingStateSuccess(data));
        },
      );*/

      final resultPlayers = await _getDashboardPlayers.execute();
      resultPlayers.fold(
        (failure) {
          emit(DashboardPlayersStateError());
        },
        (data) {
          emit(DashboardPlayersStateSuccess(data));
        },
      );
    });
  }
}
