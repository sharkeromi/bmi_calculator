import 'dart:math';

import 'package:get/get.dart';

  
class CalculatorController extends GetxController{
  
  RxList genderList = RxList(["male", "female"]);
  RxInt height = 180.obs;
  RxInt weight = 60.obs;
  RxInt age = 20.obs;
  RxString selectedGender = RxString('');
  RxDouble bmi = RxDouble(0.0);
  RxString interpretion = RxString('');
  RxString result = RxString('');

  String calculateBMI() {
    bmi.value = weight / pow(height / 100, 2);
    return bmi.value.toStringAsFixed(1);
  }

  void getResult() {
    if (bmi.value >= 25) {
      result.value = 'Overweight';
    } else if (bmi.value > 18.5) {
      result.value = 'Normal';
    } else {
      result.value = 'Underweight';
    }
  }

  void getInterpretation() {
    if (bmi.value >= 25) {
      interpretion.value = 'You have a higher than normal body weight. Try to exercise more.';

    } else if (bmi.value >= 18.5) {
       interpretion.value = 'You have a normal body weight. Good job!';
    } else {
      interpretion.value = 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}