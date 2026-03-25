import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/feature/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingProgressIndicator extends StatelessWidget {
  final OnboardingController controller;
  const OnboardingProgressIndicator({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(
              () => Text(
                "Steps ${controller.currentStep} / ${controller.totalSteps}",
                style: getTextStyle(
                  fontsize: sp(16),
                  fontweight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                Obx(
                  () => Text(
                    "${controller.xp} XP",
                    style: getTextStyle(
                      fontsize: sp(16),
                      fontweight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(width: 4.w),
                Icon(Icons.emoji_events, color: Colors.amber, size: sp(20)),
              ],
            ),
          ],
        ),
        SizedBox(height: 12),

        Row(
          children: List.generate(controller.totalSteps, (index) {
            return Expanded(
              child: Obx(() {
                bool isCompleted = index < controller.currentStep.value;
                return Container(
                  height: 6.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.primaryTextColor
                        : AppColors.primaryTextColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(100.r),
                  ),
                );
              }),
            );
          }),
        ),
      ],
    );
  }
}
