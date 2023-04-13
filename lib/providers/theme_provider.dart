import 'package:sexquare/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;

  ThemeProvider({required bool isDarkmode})
      : currentTheme = isDarkmode ? AppTheme.darkTheme : AppTheme.lightTheme;

  setLightMode() {
    // currentTheme = ThemeData.light();
    currentTheme = AppTheme.lightTheme;
    notifyListeners();
  }

  setDarkMode() {
    currentTheme = AppTheme.darkTheme;
    notifyListeners();
  }

  setXquareMode() {
    currentTheme = ThemeData.light();
    notifyListeners();
  }

  setRougeMode() {
    currentTheme = ThemeData.dark();
    notifyListeners();
  }
}

