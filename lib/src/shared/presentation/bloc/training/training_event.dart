import 'package:equatable/equatable.dart';

abstract class TrainingEvent extends Equatable {
  const TrainingEvent();
}

class TrainingStartEvent extends TrainingEvent {
  const TrainingStartEvent();

  @override
  List<Object?> get props => [];
}

class GetMyTrainingProgramListEvent extends TrainingEvent {
  const GetMyTrainingProgramListEvent();

  @override
  List<Object?> get props => [];
}
