import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/core/domain/entities/player_entity.dart';
import 'package:xmanager/src/core/domain/usecases/save_player.dart';
import 'package:xmanager/src/core/presentation/bloc/player/bloc.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  SavePlayerUseCase savePlayerUseCase;

  PlayerState get initialState => Initial();
  PlayerState get loadingState => Loading();
  //PlayerState get fullnameAdded => PlayerFullnameAdded();

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
    if (event.fullName.isNotEmpty) {
      emit(PlayerFullnameAdded(event.fullName));
    } else {
      emit(Initial());
    }
  }

  Future<void> _onSavePlayer(
    SavePlayer event,
    Emitter<PlayerState> emit,
  ) async {
    if (state is PlayerFullnameAdded) {
      print("saving");
      // final result = await savePlayerUseCase.call(
      //   PlayerEntity(
      //     fullname: event.fullName,
      //     birthdate: "",
      //   ),
      // );

      // if (result is DataSuccess) {
      //   print("saving success");

      //   emit(SavedPlayerSuccess());
      // } else {
      //   print("saving unsuccess");
      //   emit(SavedPlayerFailure());
      // }
    }
  }
}
