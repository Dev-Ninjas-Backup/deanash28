// ignore: prefer_typing_uninitialized_variables
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  // Registration fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  // OTP field
  final TextEditingController otpController = TextEditingController();

  // Password visibility states
  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  // Remember me state
  final RxBool rememberMe = false.obs;

  // OTP timer
  final RxInt resendTimer = 0.obs;
  Timer? _timer;

  // Getters
  bool get canResend => resendTimer.value == 0;

  @override
  void onInit() {
    super.onInit();
    startResendTimer();
  }

  // Password visibility toggles
  void togglePasswordVisibility() {
    isPasswordVisible.toggle();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.toggle();
  }

  void toggleRememberMe(bool value) {
    rememberMe.value = value;
  }

  // OTP timer management
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    otpController.dispose();
    super.onClose();
  }
}
