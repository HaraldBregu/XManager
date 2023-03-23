import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_state.dart';


class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardStateInitial()) {
    on<DashboardEvent>((event, emit) {
      // TODO: implement event handler
    });
    on((event, emit) => {

    });
  }
}