/// Class representing the state of the BLoC.
///
/// Technically a simple [bool] variable would suffice for the purposes
/// of this very app. A class is defined so as to demonstrate BLoC working
/// with the familiar Model-View-ViewModel architecture.
class ThemeState {
  /// Whether the app is in dark mode.
  ///
  /// This could be used standalone for the purposes of the app. A class is defined
  /// to show BLoC working with the familiar Model-View-ViewModel architecture.
  final bool isDarkMode;

  ThemeState({this.isDarkMode});

  /// Initial state of the BLoC.
  ///
  /// By default, keeps dark mode off if no preference is given.
  factory ThemeState.init(bool isDarkMode) =>
      ThemeState(isDarkMode: isDarkMode ?? false);
}
