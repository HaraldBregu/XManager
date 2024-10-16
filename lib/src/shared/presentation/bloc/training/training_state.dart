import 'package:equatable/equatable.dart';
import 'package:xmanager/src/shared/domain/entities/program_entity.dart';

class TrainingState extends Equatable {
  final List<ProgramEntity> trainingProgramList;

  const TrainingState({
    this.trainingProgramList = const [],
  });

  @override
  List<Object?> get props => [
        trainingProgramList,
      ];
}

class TrainingStateInitial extends TrainingState {
  const TrainingStateInitial({super.trainingProgramList});
}

// class TrainingStateFetched extends TrainingState {
//   const TrainingStateFetched({super.trainingProgramList});
// }
