import 'dart:async';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // final pref = Get.put(SharedPreferencesHelperController());
  // final notificationController = Get.find<NotificationController>();
  // final fcmController = Get.find<FcmNotificationController>();

  // final messageController = Get.find<MessagesController>();

  var progressIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _navigateToHome();
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed('/home');

    // Future<void> _checkLoginStatus() async {
    //   final tokenRow = await pref.getAccessRowToken();
    //   final token = await pref.getAccessToken();
    //   final userId = await pref.getUserId();

    //   final loginStatus = await pref.checkLogin();

    //   if (loginStatus == true && token != null) {

    //     if (!fcmController.openedFromNotification.value) {
    //       Get.offAllNamed(AppRoute.navBarScreen);
    //     }

    //     Future.delayed(const Duration(milliseconds: 300), () {
    //       notificationController.connectSocket(tokenRow ?? "");
    //       messageController.connectSocket(
    //         token: tokenRow ?? "",
    //         userId: userId ?? "",
    //       );
    //     });

    //   } else {
    //     Get.offAllNamed(AppRoute.onboardingScreen);
    //   }
    // }
  }
}
