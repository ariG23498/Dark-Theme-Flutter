import 'package:flutter/material.dart';

/// Builds a theme.
/// 
/// A custom theme can be applied by either replacing the return value completely
/// or customizing it. See [ThemeData.copyWith] on how to customize a [ThemeData]
/// as per your own requirements.
/// ```dart
/// ThemeData buildThemeX(){
///   ThemeData base = ThemeData();
///   return base.copyWith(
///    primaryColor: Colors.purple,
///    scaffoldBackgroundColor: Colors.black38,
///    cardColor: Colors.amber,
///   );
/// }
/// ````
/// 
/// By default, builds [ThemeData.light].
ThemeData buildThemeOne(){
  return ThemeData.light();
}

/// Builds an alternate theme.
/// 
/// A custom theme can be applied by either replacing the return value completely
/// or customizing it. See [ThemeData.copyWith] on how to customize a [ThemeData]
/// as per your own requirements.
/// 
/// By default, builds [ThemeData.dark]
ThemeData buildThemeTwo(){
  return ThemeData.dark();
}