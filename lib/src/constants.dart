import 'package:flutter/material.dart';

// Assets
const assetBmiChartImage = 'assets/images/bmi-chart.png';
const assetEnglish = 'assets/icons/en.svg';
const assetTurkish = 'assets/icons/tr.svg';

// Locales
const localeEnglish = Locale('en');
const localeTurkish = Locale('tr');

final localeAssets = <Locale, String>{
  localeEnglish: assetEnglish,
  localeTurkish: assetTurkish,
};

// Colors
const primaryColor = Color(0xFFCA4F5D);
const normalBmiColor = Color(0xFF66BB6A);
const activeButtonBgColor = Colors.white;
const activeButtonTextColor = Color(0xFFCA4F5D);
final inactiveButtonBgColor = const Color(0xFFF6CFD5).withOpacity(.5);
final inactiveButtonTextColor = Colors.white.withOpacity(.7);
const containerGradientColors = <Color>[Color(0xFFEA6B5D), Color(0xFFE95263)];

// Decorations
final actionButtonDecoration = BoxDecoration(
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      color: primaryColor.withOpacity(.4),
      blurRadius: 6,
      offset: const Offset(0, 2),
    ),
  ],
);

const mainContainerDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(blurRadius: .5, color: primaryColor),
  ],
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: containerGradientColors,
  ),
);

// Text Styles
const appBarTextStyle = TextStyle(
  color: Color(0xFFCA4F5D),
  fontSize: 22,
  fontWeight: FontWeight.w900,
);
