import 'package:bloc/bloc.dart';
import 'package:dark_template/bloc/theme_event.dart';
import 'package:dark_template/bloc/theme_state.dart';
import 'package:dark_template/utils/prefs.dart';

class ThemeBloc extends Bloc<ToggleThemeEvent, ThemeState> {
  @override
  ThemeState get initialState => ThemeState.init(prefs.getBool('isDarkTheme'));

  @override
  Stream<ThemeState> mapEventToState(ToggleThemeEvent event) async* {
    yield ThemeState(isDarkMode: !state.isDarkMode);
  }
}
