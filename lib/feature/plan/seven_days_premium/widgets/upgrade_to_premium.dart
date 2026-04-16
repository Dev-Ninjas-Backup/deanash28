import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/custom_button.dart';
import 'package:deanash_28/core/common/widgets/custom_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/gradient_background.dart';
import '../controller/seven_days_plan_controller.dart';
import 'premium_billing_dialog.dart';

class UpgradeToPremium extends StatelessWidget {
final SevenDaysPlanController controller;
  const UpgradeToPremium({super.key, required this.controller});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        decoration: BoxDecoration(color: const Color(0xFF06190A)),
        child: Stack(
          children: [
            Positioned(
              right: -50.w,
              top: -60.h,
              child: buildGlow(
                200.h,
                200.w,
                AppColors.bacgroundPositioncolor,
                144.w,
                144.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5.h,
                      horizontal: 12.w,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF00B761).withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(50.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          Iconpath.dailyCheckInIcon,
                          height: 14.h,
                          width: 14.w,
                          color: Color(0xFF00B761),
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          '+150 XP',
                          style: getTextStyle(
                            fontsize: sp(10),
                            fontweight: FontWeight.w400,
                            color: const Color(0xFF00B761),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GradientText(
                              text: "Upgrade to Premium",
                              colors: [Color(0xFF00B761), Color(0xFFFFFFFF)],
                              fontSize: sp(22),
                              fontWeight: FontWeight.w700,
                            ),
                            SizedBox(height: 6.h),
                            Text(
                              "Unlock the full 30-day structured program with 4 weeks of daily tasks and advanced features",
                              style: getTextStyle(
                                color: AppColors.primaryTextColor.withValues(
                                  alpha: .70,
                                ),
                                fontsize: sp(12),
                                fontweight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Image.asset(
                        Iconpath.sheildIcon,
                        height: 80.h,
                        width: 80.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 16.h),

                  CustomButton(
                    height: 50.h,
                    fontSize: sp(12),
                    title: "Upgrade to Premium",
                    ontap: () {
                      showDialog(
                        context: Get.context!,
                        barrierDismissible: true,
                        builder: (context) => PremiumBillingDialog(
                          onMonthlyTap: () {
                            // Handle monthly subscription
                            Get.back();
                          },
                          onAnnuallyTap: () {
                            // Handle annual subscription
                            Get.back();
                          }, controller:  controller,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Positioned(
            //   right: 20.w,
            //   top: 30.h,
            //   child: Image.asset(
            //     Iconpath.sheildIcon,
            //     height: 80.h,
            //     width: 80.w,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
