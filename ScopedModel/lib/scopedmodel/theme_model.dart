import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _userPrefs;
getPrefs() async {
  _userPrefs = await SharedPreferences.getInstance();
}

class ThemeModel extends Model {
  bool isDarkTheme = _userPrefs.getBool('isDarkTheme') ?? false;
  ThemeData theme;

  ThemeModel() {
    theme = (isDarkTheme) ? ThemeData.dark() : ThemeData.light();
  }
  void toggleTheme() {
    if (isDarkTheme) {
      theme = ThemeData.light();
    } else {
      theme = ThemeData.dark();
    }
    isDarkTheme = !isDarkTheme;
    notifyListeners();
    updatePrefs();
  }

  updatePrefs() async {
    await _userPrefs.setBool('isDarkTheme', isDarkTheme);
  }
}
