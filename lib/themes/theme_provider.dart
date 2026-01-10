import 'package:flutter/material.dart';
import 'light_mode.dart';
import 'dark_mode.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = lightModeTheme;

  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == darkModeTheme;
  
  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (isDarkMode) {
      _themeData = lightModeTheme;
    } else {
      _themeData = darkModeTheme;
    }
    notifyListeners();
  }
}