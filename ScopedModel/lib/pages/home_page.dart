import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:scopedmodel_dark_theme/pages/another_page.dart';
import 'package:scopedmodel_dark_theme/scopedmodel/theme_model.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ThemeModel>(
      builder: (context, _, model) => MaterialApp(
        title: 'Scaoped Model dark theme',
        theme: model.getTheme, //* Apply dynamic theme
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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: <Widget>[
          ScopedModelDescendant<ThemeModel>(
            builder: (context, _, model) => IconButton(
              icon: Icon(
                (!model.isDarkTheme)
                    ? FontAwesomeIcons.lightbulb
                    : FontAwesomeIcons.solidLightbulb,
                size: 18,
              ),
              onPressed: () => model
                  .toggleTheme(), // * change theme here, implement onPressed elsewhere like this wrapped in 'ScopedModelDescendant'
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
