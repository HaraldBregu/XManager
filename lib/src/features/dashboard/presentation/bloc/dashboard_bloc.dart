import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/dashboard/data/datasources/local/dashboard_datasource.dart';
import 'package:xmanager/src/features/dashboard/data/repositories/dashboard_repository_impl.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_profile.dart';
import 'package:xmanager/src/features/dashboard/domain/usecases/get_dashboard_training.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_event.dart';
import 'package:xmanager/src/features/dashboard/presentation/bloc/dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  //final GetDashboardProfile _getDashboardProfile;

  DashboardBloc() : super(DashboardStateInitial()) {
   /* on<DashboardEventStart>((event, emit) async {
      final result = await _getDashboardProfile.execute();

      result.fold(
        (failure) {
          emit(const DashboardProfileStateError(""));
        },
        (data) {
          emit(const DashboardProfileStateSuccess(""));
        },
      );
    });

    on<DashboardProfileEvent>((event, emit) => {});
    on<DashboardProgramsEvent>((event, emit) => {});
    */

    on<DashboardPlayerEvent>((event, emit) => {
      emit(const DashboardTestState("this is a message"))
    });
  }
}
