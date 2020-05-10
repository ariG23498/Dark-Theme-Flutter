import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:provider_dark_theme/pages/home_page.dart';
import 'package:provider_dark_theme/utils/prefs.dart';

void main() {
  testWidgets('Theme change test', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();
    BuildContext capturedContext;

    // Set light theme for our app.
    // The 'flutter.' prefix is required for the key.
    SharedPreferences.setMockInitialValues({'flutter.isDarkTheme': false});

    // Wait for the app to load theme preference
    await loadPrefs();

    // Build our app and trigger a frame.
    // The builder widget is used just to get the BuildContext.
    await tester.pumpWidget(
      Builder(
        builder: (BuildContext context) {
          capturedContext = context;
          return Root();
        },
      ),
    );

    // Get the current brightness
    Brightness currentBrightness = Theme.of(capturedContext).brightness;

    // Tap the '>' icon and navigate to "Another Page".
    await tester.tap(find.byIcon(Icons.arrow_forward_ios));
    await tester.pumpAndSettle();

    // Verify that we navigated to "Another Page".
    // This makes use of the fact that navigated pages typically have a BackButton on the AppBar.
    //! This test will break if the AppBar is removed or customized.
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);

    //Tap the bulb icon to change the theme.
    await tester.tap(
      (currentBrightness == Brightness.dark)
          ? find.byIcon(FontAwesomeIcons.solidLightbulb)
          : find.byIcon(FontAwesomeIcons.lightbulb),
    );
    await tester.pumpAndSettle();

    //Navigate back to "Home Page"
    //! This test will break if the AppBar is removed or customized.
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    // Verify that the brightness has changed.
    expect(
        Theme.of(tester.element(find.byIcon(Icons.arrow_forward_ios)))
            .brightness,
        isNot(equals(currentBrightness)));
  });
}
