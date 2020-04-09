import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _userPrefs;
getPrefs() async {
  _userPrefs = await SharedPreferences.getInstance();
}

class ThemeProvider with ChangeNotifier {
  ThemeData appLightTheme = ThemeData.light();
  ThemeData appDarkTheme = ThemeData.dark();
  // * Replace 'ThemeData.dark()' and 'ThemeData.light()' to your custom made dark/light themes

  //* This boolean determines the theme
  bool isDarkTheme = _userPrefs.getBool('isDarkTheme') ?? false;
  ThemeData _theme;

  ThemeProvider() {
    _theme = (isDarkTheme) ? appDarkTheme : appLightTheme;
  }
  ThemeData get getTheme => _theme;

  toggleTheme() {
    // * self explanatory, also inverts boolean
    if (isDarkTheme) {
      _theme = appLightTheme;
    } else {
      _theme = appDarkTheme;
    }
    isDarkTheme = !isDarkTheme;
    notifyListeners(); // * Notify all widgets depending on this provider to rebuild
    updatePrefs(); // * Save theme configuration
  }

  updatePrefs() async {
    await _userPrefs.setBool('isDarkTheme', isDarkTheme);
  }
}
