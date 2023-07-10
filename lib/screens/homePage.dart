import 'package:bmi_calculator/constants/colors.dart';
import 'package:bmi_calculator/constants/icons.dart';
import 'package:bmi_calculator/constants/styles.dart';
import 'package:bmi_calculator/controller/calculatorController.dart';
import 'package:bmi_calculator/screens/resultPage.dart';
import 'package:bmi_calculator/widgets/bottomButton.dart';
import 'package:bmi_calculator/widgets/reusableCard.dart';
import 'package:bmi_calculator/widgets/roundeButton.dart';
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
                    () => ReusableCard(
                      color: calculatorController.selectedGender.value ==
                              calculatorController.genderList.value[0]
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onPress: () {
                        calculatorController.selectedGender.value = 'male';
                      },
                      cardChild: IconContent(
                        icon: Icons.male,
                        label: 'MALE',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Obx(
                    () => ReusableCard(
                      color: calculatorController.selectedGender.value ==
                              calculatorController.genderList.value[1]
                          ? kActiveCardColor
                          : kInactiveCardColor,
                      onPress: () {
                        calculatorController.selectedGender.value = 'female';
                      },
                      cardChild: IconContent(
                        icon: Icons.female,
                        label: 'FEMALE',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(
              () => ReusableCard(
                color: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
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
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0),
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
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Obx(
                        () => ReusableCard(
                          color: kActiveCardColor,
                          cardChild: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'WEIGHT',
                                  style: kLabelTextStyle,
                                ),
                                Text(
                                  calculatorController.weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RoundIconButton(
                                        icon: Icons.remove,
                                        onPressed: () {
                                          calculatorController.weight.value--;
                                        }),
                                    const SizedBox(
                                      width: 10.0,
                                    ),
                                    RoundIconButton(
                                      icon: Icons.add,
                                      onPressed: () {
                                        calculatorController.weight.value++;
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Obx(
                  () => ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            calculatorController.age.value.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: Icons.remove,
                                onPressed: () {
                                  calculatorController.age.value--;
                                },
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              RoundIconButton(
                                  icon: Icons.add,
                                  onPressed: () {
                                    calculatorController.age.value++;
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
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
