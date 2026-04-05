import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/custom_button.dart';
import 'package:deanash_28/core/common/widgets/custom_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/gradient_background.dart';
import '../controller/home_controller.dart';

class PremiumCard extends StatelessWidget {
  final HomeController controller;

  const PremiumCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
                  Row(
                    children: [
                      Text(
                        "Billing: ",
                        style: getTextStyle(
                          fontweight: FontWeight.w400,
                          color: Colors.white,
                          fontsize: sp(14),
                        ),
                      ),
                      Obx(
                        () => Text(
                          "Monthly",
                          style: getTextStyle(
                            fontweight: FontWeight.w400,
                            color: controller.isMonthly.value
                                ? Color(0xFF2AFF83)
                                : Color(0xFFFFFFFF).withValues(alpha: .70),
                            fontsize: sp(14),
                          ),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Obx(
                        () => Switch(
                          padding: EdgeInsets.zero,
                          value: !controller.isMonthly.value,
                          onChanged: (val) => controller.toggleBilling(!val),
                          inactiveTrackColor: Color(
                            0xFF2AFF83,
                          ).withValues(alpha: .14),
                          activeTrackColor: Color(
                            0xFF2AFF83,
                          ).withValues(alpha: .14),
                          activeThumbColor: Color(0xFF2AFF83),
                          inactiveThumbColor: Color(0xFF2AFF83),
                        ),
                      ),
                      SizedBox(width: 8.w),
                      Obx(
                        () => Text(
                          "Annually",
                          style: getTextStyle(
                            fontweight: FontWeight.w400,
                            color: !controller.isMonthly.value
                                ? Color(0xFF2AFF83)
                                : Color(0xFFFFFFFF).withValues(alpha: .70),
                            fontsize: sp(14),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Obx(
                    () => Row(
                      children: [
                        GradientText(text: "USD \$${controller.price} "),
                        Text(
                          "/per months",
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
                  SizedBox(height: 6.h),

                  Text(
                    "Unlock the full 30-day program and AI Coach",
                    style: getTextStyle(
                      color: AppColors.primaryTextColor.withValues(alpha: .70),
                      fontsize: sp(12),
                      fontweight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 16.h),

                  CustomButton(
                    height: 50.h,
                    fontSize: sp(12),
                    title: "Upgrade to Premium",
                    ontap: () {},
                  ),
                ],
              ),
            ),

            Positioned(
              right: 20.w,
              top: 30.h,
              child: Image.asset(
                Iconpath.sheildIcon,
                height: 80.h,
                width: 80.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
