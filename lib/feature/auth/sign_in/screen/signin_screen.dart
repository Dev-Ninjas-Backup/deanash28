import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/gradient_background.dart';
import 'package:deanash_28/core/common/widgets/custom_text_field.dart';
import 'package:deanash_28/feature/auth/sign_in/controller/signin_controller.dart';
import 'package:deanash_28/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_button.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  late final SignInController controller = Get.isRegistered<SignInController>()
      ? Get.find<SignInController>()
      : Get.put(SignInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: gradientBackground(
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 100.h),
                      Image.asset(
                        Iconpath.groupLogo,
                        width: 345.w,
                        height: 155.h,
                      ),
                      SizedBox(height: 76.h),
                      Text(
                        "Get Signed in.",
                        style: getTextStyle(
                          fontsize: sp(25),
                          fontweight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 47.h),
                    ],
                  ),
                ),
                Text(
                  "Email:",
                  style: getTextStyle(
                    fontsize: sp(16),
                    fontweight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: "your@email.com",
                  prefixIcon: Icons.email_outlined,
                  controller: controller.emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 14.h),
                Text(
                  "Password:",
                  style: getTextStyle(
                    fontsize: sp(16),
                    fontweight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => CustomTextField(
                    hintText: "* * * * * * *",
                    prefixIcon: Icons.lock_outlined,
                    isPassword: true,
                    isPasswordVisible: controller.isPasswordVisible,
                    onPasswordVisibilityToggle:
                        controller.togglePasswordVisibility,
                    controller: controller.passwordController,
                  ),
                ),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Obx(
                      () => Row(
                        children: [
                          Checkbox(
                            value: controller.rememberMe,
                            onChanged: (value) {
                              controller.toggleRememberMe(value ?? false);
                            },
                            activeColor: AppColors.primaryTextColor.withValues(
                              alpha: 0.1,
                            ),
                            checkColor: AppColors.primaryTextColor,
                            side: BorderSide(
                              width: 1.2,
                              color: AppColors.primaryTextColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          ),
                          Text(
                            "Remember me",
                            style: getTextStyle(
                              fontsize: sp(14),
                              fontweight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.forgotPasswordScreen);
                      },
                      child: Text(
                        "Forgot Password?",
                        style: getTextStyle(
                          fontsize: sp(14),
                          fontweight: FontWeight.w400,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomButton(
                  title: "Sign In",
                  ontap: () {
                    Get.offAllNamed(AppRoute.onboardingScreen1);
                  },
                ),
                SizedBox(height: 56.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "New at Monev8? ",
                      style: getTextStyle(
                        fontsize: sp(14),
                        fontweight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.registrationScreen);
                      },
                      child: Text(
                        "Register",
                        style: getTextStyle(
                          fontsize: sp(14),
                          fontweight: FontWeight.w500,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
