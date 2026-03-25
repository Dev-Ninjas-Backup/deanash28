import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/gradient_background.dart';
import 'package:deanash_28/core/common/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../../routes/app_routes.dart';
import '../controller/registration_controller.dart';

class RegistrationScreen extends StatelessWidget {
  RegistrationScreen({super.key});

  late final RegistrationController controller =
      Get.isRegistered<RegistrationController>()
          ? Get.find<RegistrationController>()
          : Get.put(RegistrationController());
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
                        "Register New Account",
                        style: getTextStyle(
                          fontsize: 25.sp,
                          fontweight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 47.h),
                    ],
                  ),
                ),
                Text(
                  "Name:",
                  style: getTextStyle(
                    fontsize: 16.sp,
                    fontweight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hintText: "Enter your name",
                  prefixIcon: Icons.person_outline,
                  controller: controller.nameController,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 14.h),
                Text(
                  "Email:",
                  style: getTextStyle(
                    fontsize: 16.sp,
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
                    fontsize: 16.sp,
                    fontweight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => CustomTextField(
                    hintText: "* * * * * * *",
                    prefixIcon: Icons.lock_outlined,
                    isPassword: true,
                    isPasswordVisible: controller.isPasswordVisible.value,
                    onPasswordVisibilityToggle:
                        controller.togglePasswordVisibility,
                    controller: controller.passwordController,
                  ),
                ),
                SizedBox(height: 14.h),

                Text(
                  "Confirm Password:",
                  style: getTextStyle(
                    fontsize: 16.sp,
                    fontweight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Obx(
                  () => CustomTextField(
                    hintText: "* * * * * * *",
                    prefixIcon: Icons.lock_outlined,
                    isPassword: true,
                    isPasswordVisible:
                        controller.isConfirmPasswordVisible.value,
                    onPasswordVisibilityToggle:
                        controller.toggleConfirmPasswordVisibility,
                    controller: controller.confirmPasswordController,
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
                            value: controller.rememberMe.value,
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
                              fontsize: 14.sp,
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
                          fontsize: 14.sp,
                          fontweight: FontWeight.w400,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                CustomButton(title: "Register", ontap: () {Get.toNamed(AppRoute.otpRegistrationScreen);}),
                SizedBox(height: 56.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a Movin8 member? ",
                      style: getTextStyle(
                        fontsize: 14.sp,
                        fontweight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoute.signInScreen);
                      },
                      child: Text(
                        "Sign in",
                        style: getTextStyle(
                          fontsize: 14.sp,
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
