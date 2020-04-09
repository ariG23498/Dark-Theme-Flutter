import 'package:flutter/material.dart';

import 'package:dark_template/pages/home_page.dart';
import 'package:dark_template/utils/prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await getPrefs();
  runApp(Root());
}
