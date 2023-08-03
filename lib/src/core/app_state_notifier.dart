import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppStateNotifier with ChangeNotifier, DiagnosticableTreeMixin {
  bool _darkMode = false;
  bool get darkMode => _darkMode;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;

  void setDarkMode(bool isDarkMode) {
    _darkMode = isDarkMode;
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }

  /// Makes `Counter` readable inside the
  /// devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(StringProperty('darkMode', darkMode ? 'true' : 'false'));
  }
}
