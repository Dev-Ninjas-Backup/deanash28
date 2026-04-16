import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/common/constants/app_colors.dart';
import '../../../../core/common/constants/icons_path.dart';
import '../../../../core/common/style/global_text_style.dart';
import '../../../../core/common/widgets/custom_build_pricing.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../controller/seven_days_plan_controller.dart';

class PremiumBillingDialog extends StatelessWidget {
final SevenDaysPlanController controller;
  final VoidCallback? onMonthlyTap;
  final VoidCallback? onAnnuallyTap;

  const PremiumBillingDialog({
  required this.controller,
    super.key,
    this.onMonthlyTap,
    this.onAnnuallyTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Color(0xFF06190A).withValues(alpha: .90),
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(Iconpath.congratulationsIcon, height: 100.h),
              SizedBox(height: 16.h),

              Text(
                'Congratulations!',
                style: getTextStyle(
                  fontsize: sp(25),
                  fontweight: FontWeight.w600,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              SizedBox(height: 6.h),

              Text(
                'You\'ve completed your 7-day streak\nUnlock the full 30-Day Money Plan with Premium.',
                textAlign: TextAlign.center,
                style: getTextStyle(
                  fontsize: sp(12),
                  fontweight: FontWeight.w300,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              SizedBox(height: 18.h),

              Column(
                children: [
                  Container(
                    clipBehavior: Clip.none,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0xFFB1B1B1).withValues(alpha: .18),
                      border: Border.all(
                        color: AppColors.primaryTextColor
                      ),
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose billing cycle:',
                          style: getTextStyle(
                            fontsize: sp(20),
                            fontweight: FontWeight.w600,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        Obx(
                          () => buildPricingOption(
                          bgColor: Colors.white,
                          textColor:  AppColors.secondaryTextColor,
                            emoji: Iconpath.monthlyIcon,
                            title: 'Monthly',
                            price: '\$4.99',
                            isSelected:
                                controller.selectedBillingCycle.value ==
                                'monthly',
                            onTap: () =>
                                controller.selectedBillingCycle.value = 'monthly',
                          ),
                        ),
                        SizedBox(height: 18.h),

                        Obx(
                          () => buildPricingOption(
                            bgColor: Colors.white,
                            textColor:  AppColors.secondaryTextColor,
                            emoji: Iconpath.annuallyIcon,
                            title: 'Annually',
                            price: '\$39.99',
                            badge: '⭐ Best Value - SAVE \$20',
                            isSelected:
                                controller.selectedBillingCycle.value ==
                                'annually',
                            onTap: () =>
                                controller.selectedBillingCycle.value = 'annually',
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Text("“Better than paying monthly”",
                          style: getTextStyle(
                            fontsize: sp(12),
                            fontweight: FontWeight.w300,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.h),

                  Obx(
                    () => CustomButton(
                      title: controller.selectedBillingCycle.value == 'monthly'
                          ? 'Unlock Premium - \$4.99'
                          : 'Unlock Premium - \$39.99',
                      ontap: () async {
                        EasyLoading.show(status: 'Processing Payment...');
                        Future.delayed(Duration(seconds: 1), () {
                          EasyLoading.dismiss();
                        });
                      },
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
