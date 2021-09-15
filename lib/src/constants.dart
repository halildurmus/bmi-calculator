import 'package:flutter/material.dart';

// Assets
const String kBmiChartImage = 'assets/images/bmi-chart.png';
const String kEnglishSvg = 'assets/icons/en-US.svg';
const String kTurkishSvg = 'assets/icons/tr-TR.svg';

// Colors
const Color kPrimaryColor = Color(0xFFCA4F5D);
const Color kNormalBmiColor = Color(0xFF66BB6A);
const Color kActiveButtonBgColor = Colors.white;
const Color kActiveButtonTextColor = Color(0xFFCA4F5D);
final Color kInactiveButtonBgColor = const Color(0xFFF6CFD5).withOpacity(.5);
final Color kInactiveButtonTextColor = Colors.white.withOpacity(.7);
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
      blurRadius: 6,
      offset: const Offset(.0, 2),
    ),
  ],
);

final BoxDecoration kActionButtonDecoration = BoxDecoration(
  shape: BoxShape.circle,
  boxShadow: <BoxShadow>[
    BoxShadow(
      color: kPrimaryColor.withOpacity(.4),
      blurRadius: 6,
      offset: const Offset(0, 2),
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
  fontSize: 22,
  fontWeight: FontWeight.w900,
);
