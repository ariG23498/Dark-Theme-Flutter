import 'package:scoped_model/scoped_model.dart';
import 'package:scopedmodel_dark_theme/data/theme_state.dart';
import 'package:scopedmodel_dark_theme/utils/prefs.dart';

/// Class which manages and provides the state of the Model.
///
/// Contains an object of type [ThemeState] that represents the state. It is responsible
/// for notifing the dependent widgets to rebuild whenever this object changes.
///
/// Extends [Model] to notify dependant widgets using [notifyListeners].
class ThemeModel extends Model {
  /// The state of the model.
  ThemeState state;

  ThemeModel() : state = ThemeState.init(prefs.getBool('isDarkTheme'));

  /// Changes the state of the model.
  /// State is changed to hold a new [ThemeState] with [ThemeState.isDarkTheme] inverted
  /// and dependent widgets are notified using [notifyListeners].
  void toggleTheme() {
    state = ThemeState(isDarkTheme: !state.isDarkTheme);
    notifyListeners();
  }
}
