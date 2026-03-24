import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../controller/forgot_password_controller.dart';

class OtpForgotScreen extends StatelessWidget {
  final ForgotPasswordController controller = Get.put(
    ForgotPasswordController(),
  );
  OtpForgotScreen({super.key});
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
                      SizedBox(height: 80.h),
                      Image.asset(
                        Iconpath.groupLogo,
                        width: 345.w,
                        height: 155.h,
                      ),
                      SizedBox(height: 76.h),
                      Text(
                        "Verification",
                        style: getTextStyle(
                          fontsize: sp(25),
                          fontweight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 14.h),
                      Text(
                        "A verification code has been sent to your email. Enter the OTP to proceed.",
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
                  "OTP:",
                  style: getTextStyle(
                    fontsize: sp(16),
                    fontweight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 8.h),
                Pinput(
                  controller: controller.otpController,
                  length: 6,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  defaultPinTheme: PinTheme(
                    width: 50.w,
                    height: 50.h,
                    textStyle: getTextStyle(
                      fontsize: sp(20),
                      fontweight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryTextColor.withValues(
                          alpha: 0.3,
                        ),
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.backgroundColor.withValues(alpha: 0.5),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 55.w,
                    height: 55.h,
                    textStyle: getTextStyle(
                      fontsize: sp(20),
                      fontweight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryTextColor,
                        width: 2.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                      color: AppColors.backgroundColor.withValues(alpha: 0.5),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height: 30.h),
                CustomButton(title: "Verify", ontap: () {}),
                SizedBox(height: 14.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => Text(
                        controller.canResend
                            ? "Resend OTP"
                            : "Resend in ${controller.resendTimer} seconds",
                        textAlign: TextAlign.center,
                        style: getTextStyle(
                          fontsize: sp(14),
                          fontweight: FontWeight.w400,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Obx(
                      () => GestureDetector(
                        onTap: controller.canResend
                            ? () {
                                controller.startResendTimer();
                              }
                            : null,
                        child: Text(
                          "Resend",
                          textAlign: TextAlign.center,
                          style: getTextStyle(
                            fontsize: sp(14),
                            fontweight: FontWeight.w400,
                            color: controller.canResend
                                ? AppColors.buttonColor
                                : AppColors.primaryTextColor.withValues(
                                    alpha: 0.5,
                                  ),
                          ),
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
