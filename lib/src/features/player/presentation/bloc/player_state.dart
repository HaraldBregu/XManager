import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/player_entity.dart';

@immutable
abstract class PlayerState extends Equatable {
  const PlayerState();
}

class PlayerStateEmpty extends PlayerState {
  @override
  List<Object?> get props => [];
}

class PlayerStateLoaded extends PlayerState {
  const PlayerStateLoaded(this.playerEntity);
  final PlayerEntity playerEntity;

  @override
  List<Object?> get props => [playerEntity];
}