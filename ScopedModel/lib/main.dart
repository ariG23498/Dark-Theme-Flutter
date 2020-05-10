import 'package:flutter/material.dart';

import 'package:scopedmodel_dark_theme/pages/home_page.dart';
import 'package:scopedmodel_dark_theme/utils/prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadPrefs();
  runApp(Root());
}
