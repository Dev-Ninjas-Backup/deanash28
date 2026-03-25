import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/feature/onboarding/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class OnboardingCards extends StatelessWidget {
  final int index;
  final OnboardingController controller;

  const OnboardingCards({
    required this.index,
    required this.controller,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        margin: EdgeInsets.only(bottom: 12.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          border: Border.all(
            color: controller.selectedIndex.value == index
                ? AppColors.primaryTextColor
                : AppColors.primaryTextColor.withValues(alpha: 0.08),
            width: controller.selectedIndex.value == index ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(16.r),
          color: const Color.fromARGB(255, 29, 10, 10).withValues(
            alpha: controller.selectedIndex.value == index ? 0.08 : 0.05,
          ),
        ),
        child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              controller.options[index].iconPath,
              width: 48.w,
              height: 48.h,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.options[index].title,
                    style: getTextStyle(
                      fontsize: sp(20),
                      fontweight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    controller.options[index].description,
                    style: getTextStyle(
                      fontsize: sp(14),
                      fontweight: FontWeight.w300,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
