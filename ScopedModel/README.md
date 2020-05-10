# scopedmodel_dark_theme

The `DARK THEME` implementation using the [Scoped Model](https://pub.dev/packages/scoped_model) package.

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

If you need to change your layout, just make sure to have a button/control to call `ScopedModel.of<ThemeModel>(context).toggleTheme()` when pressed to change the theme. Tests might break if you do this, so change them accordingly.

### Trouble wrapping your head around?

* [This](https://www.youtube.com/watch?v=-MCeWP3rgI0) video by *Tensor Programming*, or [this](https://www.youtube.com/watch?v=j-27MZwRbFw) by *MTechViral* would help.
* If you are new to State management in Flutter, **Inherited Widgets** would be a great place to start (The video by *MTechViral* will also help here).

### Deprecation Note

**ScopedModel** has been largely superceded by the [Provider](https://pub.dev/packages/provider) package, which is very similar in terms of boilerplate code and functionality.

As such, this package might get [deprecated at the end of 2020](https://github.com/brianegan/scoped_model/issues/86).
