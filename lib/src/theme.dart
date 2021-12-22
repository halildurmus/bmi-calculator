import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData lightTheme(BuildContext context) => ThemeData(
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: Colors.transparent,
      ),
      brightness: Brightness.light,
      iconTheme: IconTheme.of(context).copyWith(color: primaryColor),
      primaryColor: primaryColor,
      primarySwatch: Colors.red,
      sliderTheme: SliderTheme.of(context).copyWith(
        showValueIndicator: ShowValueIndicator.always,
        valueIndicatorColor: const Color(0xFFF6CFD5).withOpacity(.3),
        valueIndicatorShape: const RectangularSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          color: inactiveButtonTextColor,
          fontSize: 15,
        ),
        trackHeight: 7,
        inactiveTrackColor: const Color(0xFFF6CFD5).withOpacity(.3),
        activeTrackColor: Colors.white,
        thumbColor: Colors.white,
        overlayColor: Colors.white.withOpacity(.2),
      ),
    );
