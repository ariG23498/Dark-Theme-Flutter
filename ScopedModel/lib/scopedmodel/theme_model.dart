import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _userPrefs;
getPrefs() async {
  _userPrefs = await SharedPreferences.getInstance();
}

class ThemeModel extends Model {
  ThemeData appDarkTheme = ThemeData.dark();
  ThemeData applightTheme = ThemeData.light();
  // * Replace 'ThemeData.dark()' and 'ThemeData.light()' to your custom made dark/light themes

  //* This boolean determines the theme
  bool isDarkTheme = _userPrefs.getBool('isDarkTheme') ?? false;
  ThemeData _theme;

  ThemeModel() {
    _theme = (isDarkTheme) ? appDarkTheme : applightTheme;
  }

  ThemeData get getTheme => _theme;

  void toggleTheme() {
    // * self explanatory, also inverts boolean
    if (isDarkTheme) {
      _theme = applightTheme;
    } else {
      _theme = appDarkTheme;
    }
    isDarkTheme = !isDarkTheme;
    notifyListeners(); // * Notify all widgets depending on this model to rebuild
    updatePrefs(); // * Save theme configuration
  }

  updatePrefs() async {
    await _userPrefs.setBool('isDarkTheme', isDarkTheme);
  }
}
