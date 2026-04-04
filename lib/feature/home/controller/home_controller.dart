import 'package:get/get.dart';

class HomeController extends GetxController {
  // Debt Freedom Progress
  final currentDebt = 0.obs;
  final totalDebt = 800.obs;
  final progressPercentage = 1.obs; // 01%
  final isDebtLogged = false.obs;
  
  void logDebt() {
    isDebtLogged.value = true;
  }
  
  double getProgressRatio() {
    return totalDebt.value > 0 ? (currentDebt.value / totalDebt.value) : 0;
  }

}
