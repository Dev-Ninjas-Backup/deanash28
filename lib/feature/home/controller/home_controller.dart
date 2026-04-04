import 'package:deanash_28/feature/home/model/transaction_model.dart';
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

  var userName = "Alex".obs;
  var streakCount = 4.obs;
  var isOnline = true.obs;
  var lastMessageTime = "26 Feb, 12 : 34 PM".obs;

  // Transaction History
  final RxList<TransactionModel> transactionHistory = <TransactionModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _initializeSampleTransactions();
  }

  void _initializeSampleTransactions() {
    transactionHistory.assignAll([
      TransactionModel(
        id: '1',
        amount: 500,
        description: 'Feb 2 - Paid debt to Jiabd',
        category: 'Debt Paid',
        date: DateTime(2025, 2, 25),
        xpGained: 25,
        icon: 'assets/icons/debt_paid.png',
      ),
      TransactionModel(
        id: '2',
        amount: 750,
        description: 'Feb 2 - Saved for buying a land',
        category: 'Savings',
        date: DateTime(2025, 2, 25),
        xpGained: 25,
        icon: 'assets/icons/savings.png',
      ),
      TransactionModel(
        id: '3',
        amount: 11000,
        description: 'Feb 2 - Earned from selling old car',
        category: 'Income',
        date: DateTime(2025, 2, 25),
        xpGained: 25,
        icon: 'assets/icons/income.png',
      ),
    ]);
  }

  void addTransaction(TransactionModel transaction) {
    transactionHistory.insert(0, transaction);
  }
}
