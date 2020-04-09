import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dark_template/bloc/index.dart';

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
                (BlocProvider.of<ThemeBloc>(context).state.isDarkMode)
                    ? FontAwesomeIcons.solidLightbulb
                    : FontAwesomeIcons.lightbulb,
                size: 18),
            onPressed: () =>
                BlocProvider.of<ThemeBloc>(context).add(ToggleThemeEvent()),
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
