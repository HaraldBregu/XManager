import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:xmanager/src/features/player/domain/repositories/player_repository.dart';

import 'bloc.dart';
/*
class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  final PlayerRepository _playerRepository;

  PlayerBloc(this._playerRepository): super(PlayerStateEmpty()) {
    on<LoadPlayerEvent>((event, emit) async {
      emit(PlayerStateEmpty());

      //emit(PlayerStateLoaded(_playerRepository.getPlayer(player)));
    });
  }

  //PlayerState get initialState => PlayerInitial();

  //PlayerBloc(super.initialState);

}*/