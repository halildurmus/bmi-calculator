import 'package:flutter/material.dart';

// Colors
const List<Color> kContainerGradientColors = <Color>[
  Color(0xFFEA6B5D),
  Color(0xFFE95562),
];

// Decorations
const BoxDecoration kContainerDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: kContainerGradientColors,
  ),
);

const Color kActiveButtonBgColor = Colors.white;

const Color kActiveButtonTextColor = Color(0xFFCA4F5D);

const double kActiveButtonElevation = 8.0;

final Color kInactiveButtonBgColor = const Color(0xFFF6CFD5).withOpacity(0.5);

Color kInactiveButtonTextColor = Colors.white.withOpacity(0.7);

const double kInactiveButtonElevation = 0.0;
