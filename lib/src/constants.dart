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
final BoxDecoration kAppBarDecoration = BoxDecoration(
  shape: BoxShape.circle,
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: kPrimaryColor.withOpacity(.4),
      blurRadius: 6.0,
      offset: const Offset(.0, 2.0),
    ),
  ],
);

final ButtonStyle kCircleButtonStyle = TextButton.styleFrom(
  backgroundColor: Colors.white,
  padding: const EdgeInsets.all(24.0),
  shape: const CircleBorder(),
  textStyle: const TextStyle(color: kPrimaryColor),
);

final BoxDecoration kCircleButtonDecoration = BoxDecoration(
  shape: BoxShape.circle,
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: kPrimaryColor.withOpacity(.4),
      blurRadius: 6.0,
      offset: const Offset(0.0, 2.0),
    ),
  ],
);

const BoxDecoration kMainContainerDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: kContainerGradientColors,
  ),
);

// Text Styles
const TextStyle kAppBarTextStyle = TextStyle(
  color: Color(0xFFCA4F5D),
  fontSize: 22.0,
  fontWeight: FontWeight.w900,
);
