import 'package:equatable/equatable.dart';

class ApplicationEntity extends Equatable {
  final String version;
  final bool darkMode;

  const ApplicationEntity({
    required this.version,
    required this.darkMode,
  });

  @override
  List<Object> get props => [
        version,
        darkMode,
      ];
}
