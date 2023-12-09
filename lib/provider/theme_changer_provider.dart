import 'package:flutter/material.dart';

class ThemeChangeProvider with ChangeNotifier {
  var _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  void setTheme(ThemeMode? newThemeMode) {
    if (newThemeMode != null && _themeMode != newThemeMode) {
      _themeMode = newThemeMode;
      notifyListeners();
    }
  }
}
