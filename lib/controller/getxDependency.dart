
import 'package:bmi_calculator/controller/calculatorController.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
   Get.lazyPut(() => CalculatorController());
   
  }
}