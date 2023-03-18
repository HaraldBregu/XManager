import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
}
/*
class LoadPlayerEvent extends PlayerEvent {
  //const LoadPlayerEvent(this.player);
  //final Player player;

  //@override
  //List<Object?> get props => [player];
}*/