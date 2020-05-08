/// A BLoC event.
/// 
/// Typically events are defined as subclasses of an abstract class,
/// each class representing the type of event.
/// ```dart
/// abstract class CounterEvent{}
/// class CounterIncrement extends CounterEvent{}
/// class CounterDecrement extends CounterEvent{}
/// ````
/// 
/// Alternatively, events can be defined using enums
/// ```dart
/// enum CounterEvent{
///   Increment,
///   Decrement
/// }
/// ````
/// 
/// For the purposes of the app, only a single class is required for toggling
/// the BLoC state.
class ToggleThemeEvent{}