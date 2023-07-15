import 'package:equatable/equatable.dart';

class AppEntity extends Equatable {
  final String version;
  final bool darkMode;

  const AppEntity({
    required this.version,
    required this.darkMode,
  });

  @override
  List<Object> get props => [
        version,
        darkMode,
      ];
}
