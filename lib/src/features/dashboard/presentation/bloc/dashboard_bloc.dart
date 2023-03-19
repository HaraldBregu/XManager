import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_data.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_player.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final GetDashboardData getDashboardData;
  final GetDashboardPlayers getDashboardPlayers;

  DashboardBloc({
    required this.getDashboardData,
    required this.getDashboardPlayers
  }) : super(DashboardStateEmpty()) {

    on<DashboardEventFetched>(_onPostFetched);

    on<DashboardEventTest>((event, emit) => {

    });
  }


  Future<void> _onPostFetched(DashboardEventFetched event, Emitter<DashboardEvent> emit) async {
   //emit(getDashboardData.call());
  }
/*
  DashboardBloc(this._dashboardRepository): super(DashboardStateInitial()) {
    on<DashboardEvent>((event, emit) async {
      emit(DashboardStateData());
      emit(DashboardStatePlayers());
    });
  }
  */


}
