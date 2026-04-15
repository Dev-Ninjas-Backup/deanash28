import 'package:get/get.dart';

class PremiumTask {
  final int id;
  final String title;
  final String description;
  final int xpReward;
  final Rx<bool> isActive;

  PremiumTask({
    required this.id,
    required this.title,
    required this.description,
    required this.xpReward,
    required bool isActive,
  }) : isActive = isActive.obs;
}