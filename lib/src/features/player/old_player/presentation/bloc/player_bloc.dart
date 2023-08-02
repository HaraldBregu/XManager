import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerStateInitial()) {
    on<PlayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
