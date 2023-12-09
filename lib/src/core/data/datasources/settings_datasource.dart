import 'package:package_info_plus/package_info_plus.dart';
import 'package:xmanager/src/core/data/models/settings_model.dart';

abstract class SettingsDataSource {
  Future<SettingsModel> getSettings();
}

class SettingsDataSourceImpl implements SettingsDataSource {
  @override
  Future<SettingsModel> getSettings() async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();

    return SettingsModel(
      appName: packageInfo.appName,
      packageName: packageInfo.packageName,
      version: packageInfo.version,
      buildNumber: packageInfo.buildNumber,
    );
  }
}
