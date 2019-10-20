import 'package:dark_template/config/index.dart';
import 'package:dark_template/universal/dev_scaffold.dart';
import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "Another Page",
      body: Container(
        child: Center(
          child: Text(
            "Hello Another",
            style: TextStyle(
                color: ConfigBloc().darkModeOn ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
