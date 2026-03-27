import 'package:get/get.dart';

class HomeController extends GetxController {
  final userName = 'Alex'.obs;
  final xpPoints = 0.obs;
  final daysStreak = 1.obs;
  final userLevel = 1.obs;
  final currentDebt = 500.0.obs;
  final debtProgress = 1.0.obs; // 01%
  final isOnline = true.obs;

  final logHistory = [
    {
      'title': '- \$500',
      'description': 'Paid debt to Jjahid',
      'date': 'Feb 25',
      'xpGain': '+25 XP',
      'xpColor': 'orange',
      'icon': '💳',
    },
    {
      'title': '+ \$750',
      'description': 'Saved for buying a land',
      'date': 'Feb 25',
      'xpGain': '+25 XP',
      'xpColor': 'green',
      'icon': '💚',
    },
    {
      'title': '+ \$11,000',
      'description': 'Earned from selling old car',
      'date': 'Feb 25',
      'xpGain': '+25 XP',
      'xpColor': 'blue',
      'icon': '💎',
    },
  ].obs;

  final billingCycle = 'monthly'.obs;
  final billingPrice = 4.99.obs;

  void updateBillingCycle(String cycle) {
    billingCycle.value = cycle;
    if (cycle == 'monthly') {
      billingPrice.value = 4.99;
    } else {
      billingPrice.value = 39.99;
    }
  }

  void startTodayCheckIn() {
    Get.snackbar('Check-In', 'Starting today\'s check-in...');
  }

  void logDebtPayment() {
    Get.snackbar('Debt Payment', 'Logging debt payment...');
  }

  void logIncome() {
    Get.snackbar('Income', 'Logging income...');
  }

  void logSavings() {
    Get.snackbar('Savings', 'Logging savings...');
  }

  void logExpense() {
    Get.snackbar('Expense', 'Logging expense...');
  }

  void askAiCoach() {
    Get.snackbar('AI Coach', 'Opening AI Coach...');
  }

  void upgrateToPremuim() {
    Get.snackbar('Premium', 'Upgrading to premium...');
  }
}
