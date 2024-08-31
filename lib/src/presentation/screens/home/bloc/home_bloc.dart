import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/presentation/screens/home/bloc/home_event.dart';
import 'package:xmanager/src/presentation/screens/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeInitialState()) {
    on<HomeStartEvent>(_onStartEvent);
  }

  Future<void> _onStartEvent(
    HomeStartEvent event,
    Emitter<HomeState> emit,
  ) async {}
}
