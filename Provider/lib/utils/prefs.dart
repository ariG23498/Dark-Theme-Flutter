import 'package:shared_preferences/shared_preferences.dart';

/// Provides saving the theme upon quitting the app.
/// Optional for the purpose of demonstrating state management.

SharedPreferences _userPrefs;

/// Get or create new object for storing theme preference.
loadPrefs() async {
  _userPrefs = await SharedPreferences.getInstance();
}

/// Get instance of preferences object
SharedPreferences get prefs => _userPrefs;

/// Update and save theme preference.
updatePrefs(bool isDarkTheme) async {
    await _userPrefs.setBool('isDarkTheme', isDarkTheme);
}