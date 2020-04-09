class ThemeState {
  final bool isDarkMode;

  ThemeState({this.isDarkMode});

  factory ThemeState.init() => ThemeState(isDarkMode: false);
}
