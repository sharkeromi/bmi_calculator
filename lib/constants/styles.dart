import 'package:bmi_calculator/constants/colors.dart';
import 'package:flutter/material.dart';

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Color(0xFF8D8E98),
);

const kNumberTextStyle =
    TextStyle(fontSize: 50.0, fontWeight: FontWeight.w900, color: Colors.white);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kTitleTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.bold,
  color: Colors.white
);

const kResultTextStyle = TextStyle(
  color: Color.fromARGB(255, 36, 216, 118),
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
    fontSize: 100.0, fontWeight: FontWeight.bold, color: Colors.white);

const kBodyTextStyle = TextStyle(fontSize: 22.0, color: Colors.white);

ButtonStyle kRoundedButtonStyle() {
  return TextButton.styleFrom(
      elevation: 5.0,
      backgroundColor: kInactiveCardColor,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      shape: const CircleBorder());
}
