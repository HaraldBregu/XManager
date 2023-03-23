import 'package:equatable/equatable.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();
}

class PlayerStateInitial extends PlayerState {
  @override
  List<Object> get props => [];
}