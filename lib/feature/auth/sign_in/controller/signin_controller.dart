import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool _isPasswordVisible = false.obs;
  final RxBool _rememberMe = false.obs;

  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get rememberMe => _rememberMe.value;

  void togglePasswordVisibility() {
    _isPasswordVisible.toggle();
  }

  void toggleRememberMe(bool value) {
    _rememberMe.value = value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
