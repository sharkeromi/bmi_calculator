import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/styles.dart';
import 'package:bmi_calculator/controller/calculatorController.dart';
import 'package:bmi_calculator/widgets/reusableCard.dart';
import 'package:bmi_calculator/widgets/roundeButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WeightAgeCard extends StatelessWidget {
  String cardType;

   WeightAgeCard({
    super.key,
    required this.cardType
  });

   CalculatorController calculatorController= Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kActiveCardColor,
      cardChild: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            cardType == 'weight'?const Text(
              'WEIGHT',
              style: kLabelTextStyle,
            ):const Text(
              'AGE',
              style: kLabelTextStyle,
            ),
            Text(
              cardType == 'weight'?calculatorController.weight.toString(): calculatorController.age.toString(),
              style: kNumberTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundIconButton(
                    icon: Icons.remove,
                    onPressed: () {
                      cardType == 'weight'?calculatorController.weight.value--: calculatorController.age.value--;
                    }),
                const SizedBox(
                  width: 10.0,
                ),
                RoundIconButton(
                  icon: Icons.add,
                  onPressed: () {
                    cardType == 'weight'?calculatorController.weight.value++: calculatorController.age.value++;
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
