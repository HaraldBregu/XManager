import 'package:equatable/equatable.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();
}

class SetPlayerFullName extends PlayerEvent {
  final String fullName;
  const SetPlayerFullName(this.fullName);

  @override
  List<Object?> get props => [fullName];
}

class SavePlayer extends PlayerEvent {
  final String fullName;
  const SavePlayer(this.fullName);

  @override
  List<Object?> get props => [fullName];
}
