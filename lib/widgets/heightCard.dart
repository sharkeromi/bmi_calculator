import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/styles.dart';
import 'package:bmi_calculator/controller/calculatorController.dart';
import 'package:bmi_calculator/widgets/reusableCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeightCard extends StatelessWidget {
   HeightCard({
    super.key,
  });

   CalculatorController calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kActiveCardColor,
      cardChild: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'HEIGHT',
            style: kLabelTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[
              Text(
                calculatorController.height.toString(),
                style: kNumberTextStyle,
              ),
              const Text(
                'cm',
                style: kLabelTextStyle,
              )
            ],
          ),
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              inactiveTrackColor: const Color(0xFF8D8E98),
              activeTrackColor: Colors.white,
              thumbColor: kTempColor,
              overlayColor: const Color(0x29EB1555),
              thumbShape:
                  const RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape:
                  const RoundSliderOverlayShape(overlayRadius: 30.0),
            ),
            child: Slider(
              value: calculatorController.height.toDouble(),
              min: 120.0,
              max: 220.0,
              onChanged: (double newValue) {
                calculatorController.height.value = newValue.round();
              },
            ),
          ),
        ],
      ),
    );
  }
}
