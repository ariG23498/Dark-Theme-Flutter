import 'package:flutter/material.dart';
import 'package:provider_dark_theme/data/theme_state.dart';
import 'package:provider_dark_theme/utils/prefs.dart';

/// Class which manages and provides the state of the Provider.
///
/// Contains an object of type [ThemeState] that represents the state. It is responsible
/// for notifing the dependent widgets to rebuild whenever this object changes.
///
/// Uses [ChangeNotifier] as a mixin to notify dependant widgets using [notifyListeners].
class ThemeProvider with ChangeNotifier {
  /// The state of the provider.
  ThemeState state;

  ThemeProvider() : state = ThemeState.init(prefs.getBool('isDarkTheme'));

  /// Changes the state of the provider.
  /// State is changed to hold a new [ThemeState] with [ThemeState.isDarkTheme] inverted
  /// and dependent widgets are notified using [notifyListeners].
  void toggleTheme() {
    state = ThemeState(isDarkTheme: !state.isDarkTheme);
    notifyListeners();
  }
}
