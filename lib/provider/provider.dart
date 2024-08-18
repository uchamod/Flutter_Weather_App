import 'package:flutter/material.dart';
import 'package:whether_app/services/preferences.dart';
import 'package:whether_app/util/theams.dart';

class ThemeProvider extends ChangeNotifier {
  Preferences _pref = Preferences();
  ThemeData _theme = AppThemeData().lightmode;

  ThemeProvider() {
    loadMode();
  }
  ThemeData get getTheme => _theme;

  set setTheme(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }

  loadMode() async {
    setTheme = await _pref.getMode()
        ? AppThemeData().darkmode
        : AppThemeData().lightmode;
  }

  changeMode(bool isDarkMode) {
    setTheme = isDarkMode ? AppThemeData().lightmode : AppThemeData().darkmode;
    _pref.storeMode(isDarkMode);
  }
}
