import 'package:equatable/equatable.dart';

abstract class AppState extends Equatable {
  const AppState();
}

class AppStateInitial extends AppState {
  @override
  List<Object?> get props => [];
}

class AppStateLoading extends AppState {
  @override
  List<Object?> get props => [];
}
