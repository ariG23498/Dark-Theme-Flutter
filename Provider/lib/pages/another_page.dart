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
              // * Display appropriate icon depending on theme by listening
              // * to changes in state
              (!Provider.of<ThemeProvider>(context).isDarkTheme)
                  ? FontAwesomeIcons.lightbulb
                  : FontAwesomeIcons.solidLightbulb,
              size: 18,
            ),
            // * change theme here by using state handling function,
            // * but do not listen to changes in state
            onPressed: () => Provider.of<ThemeProvider>(context, listen: false)
                .toggleTheme(),
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
