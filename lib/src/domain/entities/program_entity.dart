import 'package:equatable/equatable.dart';

class ProgramEntity extends Equatable {
  final String title;
  final List<int> data;

  const ProgramEntity({
    required this.title,
    required this.data,
  });

  @override
  List<Object?> get props => [
        title,
        data,
      ];
}
