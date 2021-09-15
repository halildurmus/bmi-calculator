import 'package:bmi_calculator/src/app.dart';
import 'package:bmi_calculator/src/home/widgets/slider.dart';
import 'package:bmi_calculator/src/settings/settings.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'settings/fake_settings.service.dart';

void main() {
  testWidgets('Home screen should properly display the widgets',
      (WidgetTester tester) async {
    // Sets up the SettingsController, which will glue user settings to multiple
    // Flutter Widgets.
    final SettingsController settingsController =
        SettingsController(FakeSettingsService());

    // Loads the user's preferred settings while the splash screen is displayed.
    await settingsController.loadSettings();

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      ProviderScope(child: MyApp(settingsController: settingsController)),
    );
    await tester.pump();

    expect(find.byKey(const ValueKey<String>('AppBar')), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('Gender.male')), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('Gender.female')), findsOneWidget);
    expect(find.byType(CustomSlider), findsNWidgets(2));
    expect(find.byType(FloatingActionButton), findsOneWidget);
    expect(find.byType(AnimatedCrossFade), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('BmiInfoFirst')), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('BmiInfoSecond')), findsOneWidget);

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    expect(
        find.byKey(const ValueKey<String>('BmiChartButton')), findsOneWidget);
    expect(find.text('22'), findsOneWidget);
    expect(find.text('.4'), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('BmiInterpretationText')),
        findsOneWidget);
  });
}
