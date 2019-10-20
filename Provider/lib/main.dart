import 'package:flutter/material.dart';

import 'package:provider_dark_theme/pages/home_page.dart';
import 'package:provider_dark_theme/provider/theme_provider.dart';

void main() async {
  await getPrefs();
  runApp(Root());
}
