import 'package:flutter/material.dart';

extension ThemeDataContext on BuildContext {
  ThemeData get theme => Theme.of(this);
}

extension ColorSchemeContext on BuildContext {
  ColorScheme get colorScheme => theme.colorScheme;
}

extension TextThemeContext on BuildContext {
  TextTheme get textTheme => theme.textTheme;
}
