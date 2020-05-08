import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:provider_dark_theme/pages/another_page.dart';
import 'package:provider_dark_theme/provider/theme_provider.dart';
import 'package:provider_dark_theme/ui/themes.dart';
import 'package:provider_dark_theme/utils/prefs.dart';

// * Define this to get reference in descendant widgets through context
class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // * Uses the state that is provided, thus, "consumes"
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, _) {
        return MaterialApp(
          title: 'Provider dark Theme',
          theme: themeProvider.state.isDarkTheme
              ? buildThemeTwo()
              : buildThemeOne(),
          home: MyHomePage(title: 'Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Upon exiting, save theme preferences
      onWillPop: () {
        updatePrefs(Provider.of<ThemeProvider>(context).state.isDarkTheme);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          actions: <Widget>[
            // * Another consumer widget
            Consumer<ThemeProvider>(
              builder: (context, themeProvider, _) => IconButton(
                icon: Icon(
                  (!themeProvider.state.isDarkTheme)
                      ? FontAwesomeIcons.lightbulb
                      : FontAwesomeIcons.solidLightbulb,
                  size: 18,
                ),
                onPressed: () => themeProvider.toggleTheme(),
                // * change theme here by using state handling function
                // * see './another_page.dart' for alternative implementation
              ),
            ),
          ],
        ),
        body: Center(
          child: Text(
            'Hit the bulb to change theme',
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
