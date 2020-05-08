/// Class representing the state of the app.
///
/// The state is determined by [isDarkTheme].
class ThemeState {
  /// Whether the app is in dark mode.
  final bool isDarkTheme;
  ThemeState({this.isDarkTheme});

  // Initial state of the app.
  ///
  /// By default, keeps dark mode off if no preference is given.
  factory ThemeState.init(bool isDarkTheme) =>
      ThemeState(isDarkTheme: isDarkTheme ?? false);
}
