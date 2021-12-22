import 'package:bmi_calculator/src/app.dart';
import 'package:bmi_calculator/src/home/widgets/slider.dart';
import 'package:bmi_calculator/src/settings/settings.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'settings/fake_settings.service.dart';

void main() {
  testWidgets(
    'Home screen should properly display the widgets',
    (tester) async {
      // Sets up the SettingsController with the FakeSettingsService.
      final settingsController = SettingsController(FakeSettingsService());

      // Loads the user's preferred settings before the app is rendered.
      await settingsController.loadSettings();

      // Build the MyApp widget.
      await tester.pumpWidget(
        ProviderScope(child: MyApp(settingsController: settingsController)),
      );

      expect(find.byKey(const ValueKey<String>('AppBar')), findsOneWidget);
      expect(find.byKey(const ValueKey<String>('Gender.male')), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('Gender.female')),
        findsOneWidget,
      );
      expect(find.byType(CustomSlider), findsNWidgets(2));
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(find.byType(AnimatedCrossFade), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('BmiInfoFirst')),
        findsOneWidget,
      );
      expect(
        find.byKey(const ValueKey<String>('BmiInfoSecond')),
        findsOneWidget,
      );

      // Tap into the FAB to get the BMI result.
      await tester.tap(find.byType(FloatingActionButton));
      // Wait for the animation to complete.
      await tester.pumpAndSettle();

      expect(
        find.byKey(const ValueKey<String>('BmiChartButton')),
        findsOneWidget,
      );
      expect(find.text('22'), findsOneWidget);
      expect(find.text('.4'), findsOneWidget);
      expect(
        find.byKey(const ValueKey<String>('BmiInterpretationText')),
        findsOneWidget,
      );
    },
  );
}
