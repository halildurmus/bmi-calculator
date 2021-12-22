import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import '../models/gender.dart';

class GenderToggleButton extends StatelessWidget {
  const GenderToggleButton({
    Key? key,
    required this.valueKey,
    this.onTap,
    required this.gender,
    required this.selectedGender,
    required this.text,
  }) : super(key: key);

  final ValueKey<String> valueKey;
  final VoidCallback? onTap;
  final Gender gender;
  final Gender selectedGender;
  final String text;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        selectedGender == gender ? activeButtonBgColor : inactiveButtonBgColor;
    final textColor = selectedGender == gender
        ? activeButtonTextColor
        : inactiveButtonTextColor;

    return ElevatedButton(
      key: valueKey,
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (states) => states.contains(MaterialState.disabled)
              ? Colors.white38
              : backgroundColor,
        ),
        elevation: MaterialStateProperty.resolveWith<double?>(
          (states) => 0,
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (states) => const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            gender == Gender.male
                ? FontAwesomeIcons.mars
                : FontAwesomeIcons.venus,
            color: textColor,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: textColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
