import 'package:flutter/material.dart';

class GenderToggleButton extends StatelessWidget {
  const GenderToggleButton({
    Key key,
    @required this.bgColor,
    @required this.icon,
    @required this.valueKey,
    @required this.onTap,
    @required this.text,
    @required this.textColor,
  }) : super(key: key);

  final Color bgColor;
  final IconData icon;
  final ValueKey<String> valueKey;
  final void Function() onTap;
  final String text;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      key: valueKey,
      borderRadius: BorderRadius.circular(24.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          color: bgColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(icon, color: textColor),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
