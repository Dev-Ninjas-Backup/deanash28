import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/gradient_background.dart';
import 'package:deanash_28/core/common/widgets/custom_text_field.dart';
import 'package:deanash_28/feature/auth/forgot_password/controller/forgot_password_controller.dart';
import 'package:deanash_28/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_button.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  late final ForgotPasswordController controller =
      Get.isRegistered<ForgotPasswordController>()
          ? Get.find<ForgotPasswordController>()
          : Get.put(ForgotPasswordController());
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
                SizedBox(height: 45.h),
                GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Image.asset(
                    Iconpath.backIcon,
                    width: 40.w,
                    height: 40.h,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 50.h),
                      Image.asset(
                        Iconpath.groupLogo,
                        width: 345.w,
                        height: 155.h,
                      ),
                      SizedBox(height: 76.h),
                      Text(
                        "Create New Password",
                        style: getTextStyle(
                          fontsize: sp(25),
                          fontweight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 14.h),

                      Text(
                        "Your New Password Must Be Different from Previously Used Password.",
                        textAlign: TextAlign.center,
                        style: getTextStyle(
                          fontsize: sp(14),
                          fontweight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 47.h),
                    ],
                  ),
                ),

                Text(
                  "Enter New Password:",
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
                    isPasswordVisible: controller.isNewPasswordVisible,
                    onPasswordVisibilityToggle:
                        controller.toggleNewPasswordVisibility,
                    controller: controller.newpasswordController,
                  ),
                ),
                SizedBox(height: 14.h),

                Text(
                  "Confirm New Password:",
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
                    isPasswordVisible: controller.isnewConfirmPasswordVisible,
                    onPasswordVisibilityToggle:
                        controller.toggleNewConfirmPasswordVisibility,
                    controller: controller.newConfirmPasswordController,
                  ),
                ),
                SizedBox(height: 14.h),

                SizedBox(height: 30.h),
                CustomButton(
                  title: "Update Password",
                  ontap: () {
                    Get.offAllNamed(AppRoute.signInScreen);
                  },
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
