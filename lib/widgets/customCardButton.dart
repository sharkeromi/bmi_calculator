import 'package:flutter/material.dart';

class CustomCardButton extends StatelessWidget {
  CustomCardButton(
      {super.key, required this.color, required this.cardChild, this.onPress});

  final Color color;
  final Widget cardChild;
  var onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextButton(
          onPressed: onPress,
          child: cardChild,
        ),
      ),
    );
  }
}
