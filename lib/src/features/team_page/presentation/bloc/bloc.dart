//export '';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class TeamBloc extends Bloc<TeamEvent, TeamState> {
  TeamBloc(super.initialState);

}

class TeamEvent {}

abstract class TeamState extends Equatable {
  @override
  final List props;
  const TeamState([this.props = const[]]);
}

class TeamInitial extends TeamState {}

class TeamLoading extends TeamState {}

class TeamLoaded extends TeamState {}
