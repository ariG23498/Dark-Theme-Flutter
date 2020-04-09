import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:provider_dark_theme/pages/another_page.dart';
import 'package:provider_dark_theme/provider/theme_provider.dart';

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
          theme: themeProvider.getTheme, //* Use the state
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          // * Another consumer widget
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) => IconButton(
              icon: Icon(
                (!themeProvider.isDarkTheme)
                    ? FontAwesomeIcons.lightbulb
                    : FontAwesomeIcons.solidLightbulb,
                size: 18,
              ),
              onPressed: () => themeProvider.toggleTheme(),
              // * change theme here by using state handling function
              // * can also use the 'of()' function as in 'AnotherPage()'
            ),
          ),
        ],
      ),
      body: Center(
        child: Text(
          'Home Page',
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AnotherPage()));
        },
      ),
    );
  }
}
