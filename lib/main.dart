import 'package:flutter/material.dart';

import 'file:///C:/Users/root/FlutterProjects/bmi_calculator/lib/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Colors.black.withOpacity(0),
        ),
        primarySwatch: Colors.red,
      ),
      home: const HomeScreen(title: 'BMI Calculator'),
    );
  }
}
