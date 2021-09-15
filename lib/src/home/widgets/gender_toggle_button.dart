import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constants.dart';
import '../models/gender.dart';

class GenderToggleButton extends StatelessWidget {
  const GenderToggleButton({
    Key? key,
    required this.gender,
    required this.selectedGender,
    required this.valueKey,
    this.onTap,
    required this.text,
  }) : super(key: key);

  final Gender gender;
  final Gender selectedGender;
  final ValueKey<String> valueKey;
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final Color backgroundColor = selectedGender == gender
        ? kActiveButtonBgColor
        : kInactiveButtonBgColor;

    final Color textColor = selectedGender == gender
        ? kActiveButtonTextColor
        : kInactiveButtonTextColor;

    return ElevatedButton(
      key: valueKey,
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return Colors.white38;
            }

            return backgroundColor;
          },
        ),
        elevation: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) => 0,
        ),
        padding: MaterialStateProperty.resolveWith<EdgeInsets?>(
          (Set<MaterialState> states) =>
              const EdgeInsets.symmetric(vertical: 10),
        ),
        shape: MaterialStateProperty.resolveWith<OutlinedBorder?>(
          (Set<MaterialState> states) => RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            gender == Gender.male
                ? FontAwesomeIcons.mars
                : FontAwesomeIcons.venus,
            color: textColor,
          ),
          const SizedBox(width: 8),
          Text(text, style: TextStyle(color: textColor, fontSize: 16)),
        ],
      ),
    );
  }
}
