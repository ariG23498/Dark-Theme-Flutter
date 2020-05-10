import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:scopedmodel_dark_theme/scopedmodel/theme_model.dart';

class AnotherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text('Another Page'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              (!ScopedModel.of<ThemeModel>(context).state.isDarkTheme)
                  ? FontAwesomeIcons.lightbulb
                  : FontAwesomeIcons.solidLightbulb,
              size: 18,
            ),
            // * change theme
            onPressed: () => ScopedModel.of<ThemeModel>(context).toggleTheme(),
          ),
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "Try quitting the app and launching it again.",
          ),
        ),
      ),
    );
  }
}
