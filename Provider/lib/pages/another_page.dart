import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'package:provider_dark_theme/provider/theme_provider.dart';

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
              (!Provider.of<ThemeProvider>(context).isDarkTheme)
                  ? FontAwesomeIcons.lightbulb
                  : FontAwesomeIcons.solidLightbulb,
              size: 18,
            ),
            onPressed: () => Provider.of<ThemeProvider>(context)
                .toggleTheme(), // * change theme here, implement onPressed elsewhere like this, or wrapped in 'Consumer' as in 'MyHomePage'
          ),
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
