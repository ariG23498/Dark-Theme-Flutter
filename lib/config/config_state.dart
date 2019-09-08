import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'index.dart';

@immutable
abstract class ConfigState extends Equatable {
  ConfigState([List props = const <dynamic>[]]) : super(props);
  ConfigState getStateCopy();
}

class UnConfigState extends ConfigState {
  @override
  String toString() {
    return "UnConfigState";
  }

  @override
  ConfigState getStateCopy() {
    return UnConfigState();
  }
}

class InConfigState extends ConfigState {
  @override
  String toString() {
    return "InConfigState";
  }

  @override
  ConfigState getStateCopy() {
    return InConfigState();
  }
}

class ErrorConfigState extends ConfigState {
  final String errorMessage;

  ErrorConfigState(this.errorMessage);

  @override
  String toString() {
    return "ErrorConfigState";
  }

  @override
  ConfigState getStateCopy() {
    return ErrorConfigState(this.errorMessage);
  }
}
