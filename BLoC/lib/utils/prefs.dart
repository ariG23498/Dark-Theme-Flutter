import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences _userPrefs;
getPrefs() async {
  _userPrefs = await SharedPreferences.getInstance();
}

updatePrefs(bool isDarkTheme) async {
    await _userPrefs.setBool('isDarkTheme', isDarkTheme);
}