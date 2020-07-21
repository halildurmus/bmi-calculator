import 'package:flutter/material.dart';

// Colors
const List<Color> kContainerGradientColors = <Color>[
  Color(0xFFEA6B5D),
  Color(0xFFE95562),
];

// Decorations
final BoxDecoration kContainerDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: kContainerGradientColors,
  ),
);
