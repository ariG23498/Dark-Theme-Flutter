import 'package:dark_template/config/config_bloc.dart';
import 'package:dark_template/pages/another_page.dart';
import 'package:dark_template/universal/dev_scaffold.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DevScaffold(
      title: "Home Page",
      body: Scaffold(
        body: Container(
          child: Center(
            child: Text(
              "Hello Home",
              style: TextStyle(
                  color: ConfigBloc().darkModeOn ? Colors.white : Colors.black),
            ),
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
