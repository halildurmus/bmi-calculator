import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bmicalculator/home/slider.dart';
import 'package:bmicalculator/main.dart';

void main() {
  testWidgets('Home screen should properly display the widgets',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());
    await tester.pump();

    expect(find.byKey(const ValueKey<String>('AppBar')), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('Gender.Male')), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('Gender.Female')), findsOneWidget);
    expect(find.byType(CustomSlider), findsNWidgets(2));
    expect(find.byType(FlatButton), findsOneWidget);
    expect(find.byType(AnimatedCrossFade), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('BmiInfoFirst')), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('BmiInfoSecond')), findsOneWidget);

    await tester.tap(find.byType(FlatButton));
    await tester.pumpAndSettle();

    expect(
        find.byKey(const ValueKey<String>('BmiChartButton')), findsOneWidget);
    expect(find.text('22'), findsOneWidget);
    expect(find.text('.4'), findsOneWidget);
    expect(find.byKey(const ValueKey<String>('BmiInterpretationText')),
        findsOneWidget);
  });
}
