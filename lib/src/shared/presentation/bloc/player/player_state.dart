import 'package:equatable/equatable.dart';

abstract class PlayerState extends Equatable {
  const PlayerState();

  @override
  List<Object?> get props => [];
}

class Initial extends PlayerState {}
class Loading extends PlayerState {}

class PlayerFullnameAdded extends PlayerState {
  final String fullName;
  const PlayerFullnameAdded(this.fullName);

  @override
  List<Object?> get props => [
        fullName,
      ];
}

class SavingPlayer extends PlayerState {}
class SavedPlayerSuccess extends PlayerState {}
class SavedPlayerFailure extends PlayerState {}
