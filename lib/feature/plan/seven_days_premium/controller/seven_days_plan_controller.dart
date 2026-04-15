import 'package:get/get.dart';
import '../model/seven_days_premium_task_model.dart';
class SevenDaysPlanController extends GetxController {
  final Rx<double> totalXP = 265.0.obs;
  final Rx<double> earnedXP = 25.0.obs;
  final RxList<PremiumTask> premiumTasks = <PremiumTask>[].obs;

  double get progressPercentage => (earnedXP.value / totalXP.value) * 100;
  double get remainingXP => totalXP.value - earnedXP.value;

  @override
  void onInit() {
    super.onInit();
    _initializePremiumTasks();
  }

  void _initializePremiumTasks() {
    premiumTasks.addAll([
      PremiumTask(
        id: 1,
        title: 'Review last month\'s expenses',
        description: 'Identify your top 3 spending categories',
        xpReward: 25,
        isActive: true,
      ),
      ...List.generate(
        9,
        (index) => PremiumTask(
          id: index + 2,
          title: 'Review last month\'s expenses',
          description: 'Identify your top 3 spending categories',
          xpReward: 25,
          isActive: false,
        ),
      ),
    ]);
  }
}
