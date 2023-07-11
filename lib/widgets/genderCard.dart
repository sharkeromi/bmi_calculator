import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/controller/calculatorController.dart';
import 'package:bmi_calculator/widgets/customCardButton.dart';
import 'package:bmi_calculator/widgets/icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class GenderCard extends StatelessWidget {
  final String gender;

  GenderCard({super.key, required this.gender});

  CalculatorController calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return CustomCardButton(
      color: calculatorController.selectedGender.value ==
              (gender == 'male'
                  ? calculatorController.genderList[0]
                  : calculatorController.genderList[1])
          ? kTempColor
          : kActiveCardColor,
      onPress: () {
        calculatorController.selectedGender.value = gender;
      },
      cardChild: IconContent(
        icon: gender == 'male' ? Icons.male : Icons.female,
        label: gender == 'male' ? 'MALE' : 'FEMALE',
      ),
    );
  }
}
