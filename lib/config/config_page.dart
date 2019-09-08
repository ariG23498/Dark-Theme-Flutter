import 'package:dark_template/pages/home_page.dart';
import 'package:dark_template/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'index.dart';

class ConfigPage extends StatefulWidget {
  @override
  _ConfigPageState createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  ConfigBloc configBloc;

  @override
  void initState() {
    super.initState();
    setupApp();
  }

  setupApp() {
    configBloc = new ConfigBloc(); // Object Created
    configBloc.darkModeOn =
        DevFest.prefs.getBool(DevFest.darkModePref) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => configBloc,
      child: BlocBuilder<ConfigBloc, ConfigState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'GDG Kolkata',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: DevFest.google_product_sans_family,
              primarySwatch: Colors.purple,
              primaryColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              disabledColor: Colors.grey,
              cardColor: configBloc.darkModeOn ? Colors.black : Colors.white,
              canvasColor:
                  configBloc.darkModeOn ? Colors.black : Colors.grey[50],
              brightness:
                  configBloc.darkModeOn ? Brightness.dark : Brightness.light,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                    colorScheme: configBloc.darkModeOn
                        ? ColorScheme.dark()
                        : ColorScheme.light(),
                  ),
              appBarTheme: AppBarTheme(
                elevation: 0.0,
              ),
            ),
            home: HomePage(),
          );
        },
      ),
    );
  }
}
