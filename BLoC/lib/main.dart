import 'package:flutter/material.dart';

import 'package:dark_template/pages/home_page.dart';
import 'package:dark_template/utils/prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Wait for the app to load/create theme preference
  await loadPrefs();
  runApp(Root());
}
