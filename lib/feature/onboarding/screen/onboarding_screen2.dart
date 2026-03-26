// ignore_for_file: deprecated_member_use

import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/custom_button.dart';
import 'package:deanash_28/core/common/widgets/gradient_background.dart';
import 'package:deanash_28/feature/onboarding/controller/onboarding_controller.dart';
import 'package:deanash_28/feature/onboarding/widgets/onboarding_cards.dart';
import 'package:deanash_28/feature/onboarding/widgets/onboarding_progress_indicator.dart';
import 'package:deanash_28/feature/onboarding/widgets/you_are_all_set_dialog.dart';
import 'package:deanash_28/feature/onboarding/widgets/step4_premium_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/constants/icons_path.dart';
import '../widgets/step2_content.dart';
class OnboardingScreen2 extends StatelessWidget {
  const OnboardingScreen2({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          controller.previousStep();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Obx(
          () {
            if (controller.showYouAreAllSetDialog.value) {
              // Show dialog
              WidgetsBinding.instance.addPostFrameCallback((_) {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => YouAreAllSetDialog(controller: controller),
                ).then((_) {
                  controller.showYouAreAllSetDialog.value = false;
                });
              });
            }
            return gradientBackground(
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 45.h),
                      GestureDetector(
                        onTap: () {
                          controller.previousStep();
                        },
                        child: Image.asset(
                          Iconpath.backIcon,
                          width: 40.w,
                        height: 40.h,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    OnboardingProgressIndicator(controller: controller),
                    SizedBox(height: 20.h),

                    Obx(
                      () => Text(
                        controller.getStepTitle(),
                        style: getTextStyle(
                          fontsize: sp(25),
                          fontweight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Obx(
                      () => Text(
                        controller.getStepSubtitle(),
                        style: getTextStyle(
                          fontsize: sp(14),
                          fontweight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    Obx(
                      () => controller.currentStep.value == 2
                          ? buildStep2Content(controller)
                          : controller.currentStep.value == 4
                              ? Step4PremiumContent(controller: controller)
                              : Column(
                                  children: List.generate(
                                    controller.currentStepOptions.length,
                                    (index) => GestureDetector(
                                      onTap: () {
                                        controller.selectOption(index);
                                      },
                                      child: OnboardingCards(
                                        controller: controller,
                                        index: index,
                                      ),
                                    ),
                                  ),
                                ),
                    ),
                    SizedBox(height: 30.h),
                    Obx(
                      () => controller.currentStep.value == 4
                          ? SizedBox.shrink()
                          : CustomButton(
                              title: "Continue",
                              ontap: () {
                                controller.nextStep();
                              },
                            ),
                    ),
                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      ),
    );
  }

 }