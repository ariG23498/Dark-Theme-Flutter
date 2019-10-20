import 'package:dark_template/utils/devfest.dart';

import 'index.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  ConfigEvent([List props = const <dynamic>[]]) : super(props);
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc configBloc});
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn; //acts as a switch whether the mode is on or of

  DarkModeEvent(this.darkOn);

  @override
  String toString() {
    return "DarkModeEvent";
  }

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc configBloc}) async {
    try {
      configBloc.darkModeOn = darkOn;
      DevFest.prefs.setBool(DevFest.darkModePref, darkOn);
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() {
    return 'LoadConfigEvent';
  }

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc configBloc}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}
