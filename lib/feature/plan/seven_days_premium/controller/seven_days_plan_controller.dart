import 'package:get/get.dart';

class SevenDaysPlanController extends GetxController {

  final Rx<double> totalXP = 265.0.obs;
  final Rx<double> earnedXP = 25.0.obs;

  double get progressPercentage => (earnedXP.value / totalXP.value) * 100;
  double get remainingXP => totalXP.value - earnedXP.value;

}
