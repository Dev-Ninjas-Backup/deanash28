import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  // Email and OTP controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  // Password visibility states
  final RxBool _isNewPasswordVisible = false.obs;
  final RxBool _isnewConfirmPasswordVisible = false.obs;

  // Password controllers
  final TextEditingController newpasswordController = TextEditingController();
  final TextEditingController newConfirmPasswordController =
      TextEditingController();

  // Timer for resend OTP
  final RxInt resendTimer = 0.obs;
  Timer? _timer;

  // Getters
  bool get isNewPasswordVisible => _isNewPasswordVisible.value;
  bool get isnewConfirmPasswordVisible => _isnewConfirmPasswordVisible.value;
  bool get canResend => resendTimer.value == 0;

  @override
  void onInit() {
    super.onInit();
    startResendTimer();
  }

  // Password visibility toggles
  void togglePasswordVisibility() {}

  void toggleNewPasswordVisibility() {
    _isNewPasswordVisible.toggle();
  }

  void toggleNewConfirmPasswordVisibility() {
    _isnewConfirmPasswordVisible.toggle();
  }

  // Resend timer
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

  @override
  void onClose() {
    _timer?.cancel();
    emailController.dispose();
    otpController.dispose();
    newpasswordController.dispose();
    newConfirmPasswordController.dispose();
    super.onClose();
  }
}
