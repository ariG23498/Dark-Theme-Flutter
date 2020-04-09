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
          )
        ],
      ),
      body: Container(
        child: Center(
          child: Text(
            "Hello Another",
          ),
        ),
      ),
    );
  }
}
