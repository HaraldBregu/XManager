import 'package:equatable/equatable.dart';

class SettingsEntity extends Equatable {
  final String appName;
  final String packageName;
  final String version;
  final String buildNumber;

  const SettingsEntity({
    required this.appName,
    required this.packageName,
    required this.version,
    required this.buildNumber,
  });

  @override
  List<Object?> get props => [
        appName,
        packageName,
        version,
        buildNumber,
      ];
}
