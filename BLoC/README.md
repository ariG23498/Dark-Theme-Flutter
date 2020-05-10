# dark_template_BloC

The `DARK THEME` implementation using the [Flutter BLoC](https://pub.dev/packages/flutter_bloc) package.

## How to use your custom themes

Go to `./lib/ui/themes.dart`, and provide your own custom themes in `buildThemeOne()` and `buildThemeTwo()`, or change any property of your choice using `ThemeData.copywith()`.

```dart
ThemeData buildThemeX(){
  ThemeData base = ThemeData();
  return base.copyWith(
    primaryColor: Colors.purple,
    scaffoldBackgroundColor: Colors.black38,
    cardColor: Colors.amber,
  );
}
````

If you need to change your layout, just make sure to have a button/control to call `BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent())` when pressed to change the theme. Tests might break if you do this, so change them accordingly.
