import 'package:flutter/material.dart';

// Colors
const Color kPrimaryColor = Color(0xFFCA4F5D);
const Color kActiveButtonBgColor = Colors.white;
const Color kActiveButtonTextColor = Color(0xFFCA4F5D);
final Color kInactiveButtonBgColor = const Color(0xFFF6CFD5).withOpacity(0.5);
final Color kInactiveButtonTextColor = Colors.white.withOpacity(0.7);
const List<Color> kContainerGradientColors = <Color>[
  Color(0xFFEA6B5D),
  Color(0xFFE95263),
];

// Decorations
const BoxDecoration kMainContainerDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: kContainerGradientColors,
  ),
);

const TextStyle kAppBarTextStyle = TextStyle(
  color: Color(0xFFCA4F5D),
  fontSize: 22.0,
  fontWeight: FontWeight.w900,
);

const double kActiveButtonElevation = 8.0;
const double kInactiveButtonElevation = 0.0;
