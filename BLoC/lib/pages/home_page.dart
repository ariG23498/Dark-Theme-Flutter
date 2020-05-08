import 'package:dark_template/utils/prefs.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dark_template/bloc/index.dart';
import 'package:dark_template/pages/another_page.dart';

import 'package:dark_template/ui/themes.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, _themeState) {
        return MaterialApp(
          title: 'BLoC dark Theme',
          theme: _themeState.isDarkMode ? buildThemeTwo() : buildThemeOne(),
          home: MyHomePage(title: 'Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      /// Upon exiting, save theme preferences
      onWillPop: () {
        updatePrefs(BlocProvider.of<ThemeBloc>(context).state.isDarkMode);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          actions: <Widget>[
            // * Another blocbuilder widget
            /// The state of the BLoC determines whether the bulb would be filled or not.
            /// As such, a BlocBuilder is required.
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, _themeState) => IconButton(
                icon: Icon(
                  (!_themeState.isDarkMode)
                      ? FontAwesomeIcons.lightbulb
                      : FontAwesomeIcons.solidLightbulb,
                  size: 18,
                ),
                onPressed: () =>
                    BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent()),
                // * change theme here by adding the toggle event
              ),
            ),
          ],
        ),
        body: Center(
          child: Text(
            "Hit the bulb to change theme",
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AnotherPage()));
          },
        ),
      ),
    );
  }
}
