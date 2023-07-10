import 'package:bmi_calculator/constants/styles.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  var icon;
  var onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Icon(
        icon,
        color: Colors.white,
        size: 45,
      ),
      onPressed: onPressed,
      style: kRoundedButtonStyle(),
    );
  }
}
