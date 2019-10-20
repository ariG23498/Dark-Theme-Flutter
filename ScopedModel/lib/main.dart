import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:scopedmodel_dark_theme/pages/home_page.dart';
import 'package:scopedmodel_dark_theme/scopedmodel/theme_model.dart';

void main() async {
  await getPrefs();
  runApp(
    ScopedModel(
      model: ThemeModel(),
      child: MyApp(),
    ),
  );
}
