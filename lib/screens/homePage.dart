import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/widgets/heightCard.dart';
import 'package:bmi_calculator/widgets/genderCard.dart';
import 'package:bmi_calculator/controller/calculatorController.dart';
import 'package:bmi_calculator/screens/resultPage.dart';
import 'package:bmi_calculator/widgets/bottomButton.dart';
import 'package:bmi_calculator/widgets/weightAgeCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  CalculatorController calculatorController = Get.find<CalculatorController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
        backgroundColor: kBottomContainerColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Obx(
                    () => GenderCard(gender: 'male'),
                  ),
                ),
                Expanded(
                  child: Obx(() => GenderCard(gender: 'female')),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => HeightCard(),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Obx(
                        () => WeightAgeCard(
                          cardType: 'weight',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(() => WeightAgeCard(cardType: 'age')),
              ),
            ],
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              calculatorController.calculateBMI();
              calculatorController.getResult();
              calculatorController.getInterpretation();
              Get.to(ResultsPage());
            },
          ),
        ],
      ),
    );
  }
}
