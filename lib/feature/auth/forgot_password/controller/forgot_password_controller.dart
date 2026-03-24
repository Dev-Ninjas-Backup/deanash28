import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final RxInt resendTimer = 0.obs;
  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    startResendTimer();
  }

  void startResendTimer() {
    resendTimer.value = 30;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (resendTimer.value > 0) {
        resendTimer.value--;
      } else {
        _timer?.cancel();
      }
    });
  }

  bool get canResend => resendTimer.value == 0;

  @override
  void onClose() {
    _timer?.cancel();
    emailController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
