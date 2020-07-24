import 'package:flutter/material.dart';

import 'package:bmicalculator/home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        primarySwatch: Colors.red,
      ),
      home: const SafeArea(child: HomeScreen(title: 'BMI Calculator')),
    );
  }
}
