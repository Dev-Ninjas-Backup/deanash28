import 'package:get/get.dart';

class DailyTaskController extends GetxController {
  final RxBool isCompleted = false.obs;

  void completeTask() {
    isCompleted.value = true;
  }

  void resetTask() {
    isCompleted.value = false;
  }
}
