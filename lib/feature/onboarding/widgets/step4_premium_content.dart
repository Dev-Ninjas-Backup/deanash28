import 'package:deanash_28/feature/navbar/navbar_wid/navbar_main_shell.dart';
import 'package:deanash_28/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/constants/app_colors.dart';
import '../../../core/common/constants/icons_path.dart';
import '../../../core/common/style/global_text_style.dart';
import '../../../core/common/widgets/custom_button.dart';
import '../controller/onboarding_controller.dart';

class Step4PremiumContent extends StatelessWidget {
  final OnboardingController controller;

  const Step4PremiumContent({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLimitedFreeVersion.value
          ? _buildLimitedFreeContent()
          : _buildPremiumContent(),
    );
  }

  Widget _buildPremiumContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFeaturesTable(),
          SizedBox(height: 32.h),
          Container(
            clipBehavior: Clip.none,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            decoration: BoxDecoration(
              color: AppColors.primaryTextColor.withValues(alpha: .05),
              border: Border.all(
                color: AppColors.primaryTextColor.withValues(alpha: .08),
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
                    color: AppColors.primaryTextColor,
                  ),
                ),
                SizedBox(height: 12.h),

                // Monthly pricing option
                Obx(
                  () => _buildPricingOption(
                    emoji: Iconpath.monthlyIcon,
                    title: 'Monthly',
                    price: '\$4.99',
                    isSelected:
                        controller.selectedBillingCycle.value == 'monthly',
                    onTap: () => controller.selectBillingCycle('monthly'),
                  ),
                ),
                SizedBox(height: 18.h),

                // Annual pricing option
                Obx(
                  () => _buildPricingOption(
                    emoji: Iconpath.annuallyIcon,
                    title: 'Annually',
                    price: '\$39.99',
                    badge: '⭐ Best Value - SAVE \$20',
                    isSelected:
                        controller.selectedBillingCycle.value == 'annually',
                    onTap: () => controller.selectBillingCycle('annually'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),

          // Continue Checkout button
          Obx(
            () => CustomButton(
              title: controller.selectedBillingCycle.value == 'monthly'
                  ? 'Continue Checkout - \$4.99'
                  : 'Continue Checkout - \$39.99',
              ontap: () async {
                EasyLoading.show(status: 'Processing Payment...');
                Future.delayed(Duration(seconds: 1), () {
                  EasyLoading.dismiss();
                });
              },
            ),
          ),
          SizedBox(height: 16.h),

          // Footer text
          Center(
            child: Text(
              'Then \$39.99/year · Cancel anytime · No hidden fees',
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontsize: sp(14),
                fontweight: FontWeight.w300,
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Continue with limited features link
          Center(
            child: GestureDetector(
              onTap: () {
                controller.isLimitedFreeVersion.value = true;
              },
              child: Text(
                'Continue with limited free features',
                style:
                    getTextStyle(
                      fontsize: sp(16),
                      fontweight: FontWeight.w400,
                      color: AppColors.primaryTextColor,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryTextColor,
                      height: 2,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLimitedFreeContent() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFeaturesTable(),
          SizedBox(height: 32.h),

          // Continue With Free Access button
          CustomButton(
            title: 'Continue With Free Access',
            ontap: () {
              EasyLoading.show(status: 'Loading Free Version...');
              Future.delayed(Duration(seconds: 1), () {
                EasyLoading.dismiss();
                Get.offAll(MainShell());
               // Get.offAllNamed(AppRoute.getHomeScreen());
              });
            },
          ),
          SizedBox(height: 16.h),

          Center(
            child: GestureDetector(
              onTap: () {},
              child: Text(
                'Continue with 7 Days Premium Trial',
                style:
                    getTextStyle(
                      fontsize: sp(14),
                      fontweight: FontWeight.w300,
                      color: AppColors.primaryTextColor,
                    ).copyWith(
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryTextColor,
                    ),
              ),
            ),
          ),
          SizedBox(height: 16.h),

          // Footer text
          Center(
            child: Text(
              'After 7-day premium trial, \$4.99 per month will be charged or will be demoted to the free version.',
              textAlign: TextAlign.center,
              style: getTextStyle(
                fontsize: sp(14),
                fontweight: FontWeight.w300,
                color: AppColors.primaryTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildFeaturesTable() {
    final features = [
      {
        'icon': Iconpath.sevendayChallengeIcon,
        'name': '7-Day Challenge Plan',
        'free': true,
        'premium': true,
      },
      {
        'icon': Iconpath.exposeIcon,
        'name': 'Expense & Budget Tracking',
        'free': true,
        'premium': true,
      },
      {
        'icon': Iconpath.dailyCheckInIcon,
        'name': 'Daily Check-ins & XP',
        'free': true,
        'premium': true,
      },
      {
        'icon': Iconpath.thirtydayChallengeIcon,
        'name': '30-Day Structured Program',
        'free': false,
        'premium': true,
      },
      {
        'icon': Iconpath.weeklyAiicon,
        'name': 'Weekly AI Money Reviews',
        'free': false,
        'premium': true,
      },
      {
        'icon': Iconpath.advancedProgressIcon,
        'name': 'Advanced Progress Analytics',
        'free': false,
        'premium': true,
      },
      {
        'icon': Iconpath.priorityCoachIcon,
        'name': 'Priority Coach Access',
        'free': false,
        'premium': true,
      },
      {
        'icon': Iconpath.unlimitedFinancialIcon,
        'name': 'Unlimited Financial Logs',
        'free': false,
        'premium': true,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 16.h),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Text(
                  'Feature',
                  style: getTextStyle(
                    fontsize: sp(14),
                    fontweight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Free',
                    style: getTextStyle(
                      fontsize: sp(14),
                      fontweight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Premium',
                    style: getTextStyle(
                      fontsize: sp(14),
                      fontweight: FontWeight.w600,
                      color: Color(0xFF4EB669),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Features rows
        ...List.generate(features.length, (index) {
          final feature = features[index];
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        children: [
                          Image.asset(
                            feature['icon'] as String,
                            width: 26.w,
                            height: 26.h,
                          ),
                          SizedBox(width: 8.w),
                          Expanded(
                            child: Text(
                              feature['name'] as String,
                              style: getTextStyle(
                                fontsize: sp(14),
                                fontweight: FontWeight.w300,
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          feature['free'] == true ? '✓' : '✗',
                          style: getTextStyle(
                            fontsize: sp(18),
                            fontweight: FontWeight.w600,
                            color: feature['free'] == true
                                ? Colors.green
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '✓',
                          style: getTextStyle(
                            color: Colors.green,
                            fontsize: sp(18),
                            fontweight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (index < features.length - 1)
                Divider(color: Colors.grey.withValues(alpha: 0.1), height: 0.h),
            ],
          );
        }),
      ],
    );
  }

  Widget _buildPricingOption({
    required String emoji,
    required String title,
    required String price,
    String? badge,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryTextColor
              : AppColors.primaryTextColor.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(
            color: isSelected
                ? AppColors.primaryTextColor
                : AppColors.primaryTextColor.withValues(alpha: 0.08),
            width: 1.5,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                Image.asset(emoji, width: 40.w, height: 40.h),
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: getTextStyle(
                          fontsize: sp(14),
                          fontweight: FontWeight.w600,
                          color: isSelected
                              ? AppColors.secondaryTextColor
                              : AppColors.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  price,
                  style: getTextStyle(
                    fontsize: sp(14),
                    fontweight: FontWeight.w700,
                    color: isSelected
                        ? AppColors.secondaryTextColor
                        : AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
            if (badge != null)
              Positioned(
                top: -25.h,
                right: 30.w,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: Color(0xFF244BE9),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text(
                    badge,
                    style: getTextStyle(
                      fontsize: sp(10),
                      fontweight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
