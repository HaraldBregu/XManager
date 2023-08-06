import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/usecases/save_player.dart';
import 'package:xmanager/src/core/presentation/bloc/player/bloc.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  SavePlayerUseCase savePlayerUseCase;

  PlayerBloc({
    required this.savePlayerUseCase,
  }) : super(Initial()) {
    on<SetPlayerFullName>(_onSetPlayerFullName);
    on<SavePlayer>(_onSavePlayer);
  }
  Future<void> _onSetPlayerFullName(
    SetPlayerFullName event,
    Emitter<PlayerState> emit,
  ) async {
    emit(PlayerFullnameAdded(event.fullName));
  }

  Future<void> _onSavePlayer(
    SavePlayer event,
    Emitter<PlayerState> emit,
  ) async {
    if (state is PlayerFullnameAdded) {
      print("saving");
    }
    //savePlayerUseCase.call(player)
  }
}
