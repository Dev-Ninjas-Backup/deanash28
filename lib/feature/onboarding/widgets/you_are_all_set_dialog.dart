import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/constants/app_colors.dart';
import '../../../core/common/style/global_text_style.dart';
import '../../../core/common/widgets/custom_button.dart';
import '../controller/onboarding_controller.dart';

class YouAreAllSetDialog extends StatelessWidget {
  final OnboardingController controller;

  const YouAreAllSetDialog({required this.controller, super.key});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.backgroundColor,
      insetPadding: EdgeInsets.symmetric(horizontal: 18.w),
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            color: AppColors.primaryTextColor,
            borderRadius: BorderRadius.circular(24.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Iconpath.setAllSetIcon, height: 68.h, width: 68.w),
              SizedBox(height: 18.h),
              Text(
                'You\'re All Set!',
                style: getTextStyle(
                  fontsize: sp(25),
                  fontweight: FontWeight.w600,
                  color: AppColors.secondaryTextColor,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8.h),

              Text(
                'Let\'s start your first Money Check-In',
                style: getTextStyle(
                  fontsize: sp(12),
                  fontweight: FontWeight.w300,
                  color: Color(0xFF0C0726),
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 24.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                decoration: BoxDecoration(
                  color: Color(0xFFE9E9EB),
                  borderRadius: BorderRadius.circular(24.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose your vibe:',
                      style: getTextStyle(
                        fontsize: sp(12),
                        fontweight: FontWeight.w600,
                        color: AppColors.secondaryTextColor,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    GridView.count(
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      mainAxisSpacing: 12.h,
                      crossAxisSpacing: 10.w,
                      childAspectRatio: 1.0,
                      children: List.generate(
                        controller.checkInVibeOptions.length,
                        (index) => Obx(
                          () => GestureDetector(
                            onTap: () {
                              controller.selectCheckInVibe(index);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 10.w,
                                vertical: 12.h,
                              ),
                              decoration: BoxDecoration(
                                color:
                                    controller.selectedCheckInVibeIndex.value ==
                                        index
                                    ? Color(0xFF00A31E).withValues(alpha: 0.19)
                                    : Color(0xFF0C0726).withValues(alpha: 0.05),
                                borderRadius: BorderRadius.circular(16.r),
                                border: Border.all(
                                  color:
                                      controller
                                              .selectedCheckInVibeIndex
                                              .value ==
                                          index
                                      ? Color(
                                          0xFF00A31E,
                                        ).withValues(alpha: 0.33)
                                      : Color(
                                          0xFF0C0726,
                                        ).withValues(alpha: 0.05),
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    controller
                                            .checkInVibeOptions[index]['emoji'] ??
                                        '',
                                    style: getTextStyle(fontsize: sp(32)),
                                  ),
                                  SizedBox(height: 8.h),
                                  Text(
                                    controller
                                            .checkInVibeOptions[index]['title'] ??
                                        '',
                                    style: getTextStyle(
                                      fontsize: sp(12),
                                      fontweight: FontWeight.w600,
                                      color: Colors.black87,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    controller
                                            .checkInVibeOptions[index]['subtitle'] ??
                                        '',
                                    style: getTextStyle(
                                      fontsize: sp(10),
                                      fontweight: FontWeight.w400,
                                      color: Color(0xFF0C0726),
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24.h),

              // Start Check-In Button
              CustomButton(
                title: 'Start Check-In',
                ontap: () {
                  if (controller.selectedCheckInVibeIndex.value != null) {
                    Get.back();
                    controller.proceedToStep4();
                  } else {
                    EasyLoading.showToast(
                      'Please select a vibe to proceed',
                      toastPosition: EasyLoadingToastPosition.center,
                    );
                  }
                },
              ),
              SizedBox(height: 16.h),

              GestureDetector(
                onTap: () {
                  Get.back();
                  controller.proceedToStep4();
                },
                child: Text(
                  'Continue Onboarding',

                  style: getTextStyle(
                    fontsize: sp(16),
                    fontweight: FontWeight.w400,
                    color: Color(0xFF0C0726),
                  ).copyWith(decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
