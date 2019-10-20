import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:provider_dark_theme/pages/another_page.dart';
import 'package:provider_dark_theme/provider/theme_provider.dart';

// * Had to define this to get 'context' in descendant widgets
class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeProvider>(
      builder: (context) => ThemeProvider(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider dark Theme',
      theme:
          Provider.of<ThemeProvider>(context).getTheme, //* Apply dynamic theme
      home: MyHomePage(title: 'Home Page'),
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
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, _) => IconButton(
              icon: Icon(
                (!themeProvider.isDarkTheme)
                    ? FontAwesomeIcons.lightbulb
                    : FontAwesomeIcons.solidLightbulb,
                size: 18,
              ),
              onPressed: () => themeProvider
                  .toggleTheme(), // * change theme here, implement onPressed elsewhere like this wrapped in 'Consumer'
              // * or using the 'of()' function as in 'AnotherPage()'
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
