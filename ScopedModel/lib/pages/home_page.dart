import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:scopedmodel_dark_theme/pages/another_page.dart';
import 'package:scopedmodel_dark_theme/scopedmodel/theme_model.dart';
import 'package:scopedmodel_dark_theme/ui/themes.dart';
import 'package:scopedmodel_dark_theme/utils/prefs.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: ThemeModel(),
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(
      builder: (context, _, model) => MaterialApp(
        title: 'Scaoped Model dark theme',
        theme: model.state.isDarkTheme ? buildThemeTwo() : buildThemeOne(),
        home: MyHomePage(title: 'Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        updatePrefs(ScopedModel.of<ThemeModel>(context).state.isDarkTheme);
        return Future.value(true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          actions: <Widget>[
            ScopedModelDescendant<ThemeModel>(
              builder: (context, _, model) => IconButton(
                icon: Icon(
                  (!model.state.isDarkTheme)
                      ? FontAwesomeIcons.lightbulb
                      : FontAwesomeIcons.solidLightbulb,
                  size: 18,
                ),
                // * change theme, see './another_page.dart' for alternative implementation
                onPressed: () => model.toggleTheme(),
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
