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
import '../controller/forgot_password_controller.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final ForgotPasswordController controller = Get.put(
    ForgotPasswordController(),
  );
  ForgotPasswordScreen({super.key});
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
                child: Image.asset(Iconpath.backIcon, width: 40.w, height: 40.h)),
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 80.h),
                      Image.asset(
                        Iconpath.groupLogo,
                        width: 345.w,
                        height: 155.h,
                      ),
                      SizedBox(height: 76.h),
                      Text(
                        "Forgot Password?",
                        style: getTextStyle(
                          fontsize: 25.sp,
                          fontweight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        "Enter your email we'll send you a OTP to reset your password",
                        textAlign: TextAlign.center,
                        style: getTextStyle(
                          fontsize: 14.sp,
                          fontweight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 47.h),
                    ],
                  ),
                ),
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

                SizedBox(height: 30.h),
                CustomButton(title: "Send", ontap: () {Get.toNamed(AppRoute.getOtpForgotScreen());}),
                SizedBox(height: 14.h),
                CustomButton(
                  title: "Cancel",
                  buttonColor: AppColors.primaryTextColor,
                  textColor: AppColors.buttonColor,
                  ontap: () {
                    Get.back();
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
