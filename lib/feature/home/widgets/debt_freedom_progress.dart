import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/custom_gradient_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/constants/icons_path.dart';
import '../controller/home_controller.dart';

Widget debtFreedomProgress(HomeController controller) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xFFEDEDED),
      borderRadius: BorderRadius.circular(20.r),
    ),
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Debt Freedom Progress',
              style: getTextStyle(
                fontsize: sp(20),
                fontweight: FontWeight.w700,
                color: AppColors.secondaryTextColor,
              ),
            ),
            Obx(
              () => Text(
                '${controller.progressPercentage.value.toString().padLeft(2, '0')}%',
                style: getTextStyle(
                  fontsize: sp(20),
                  fontweight: FontWeight.w700,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 4.h),
        Obx(
          () => Text(
            '\$${(controller.totalDebt.value - controller.currentDebt.value).toString()} remaining',
            style: getTextStyle(
              fontsize: sp(12),
              fontweight: FontWeight.w300,
              color: AppColors.secondaryTextColor,
            ),
          ),
        ),
        SizedBox(height: 12.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: const Color(0xFF06190A),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child:
              // Left Content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Current debt',
                    style: getTextStyle(
                      fontsize: sp(12),
                      fontweight: FontWeight.w400,
                      color: AppColors.primaryTextColor.withValues(alpha: 0.99),
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //  mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        //   mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(
                            () => GradientText(
                              text:
                                  "\$${controller.currentDebt.value.toString()}",
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 13.w,
                              vertical: 7.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17.r),
                              color: AppColors.buttonColor,
                            ),
                            child: Text(
                              'Log you first debt',
                              style: getTextStyle(
                                fontsize: sp(10),
                                fontweight: FontWeight.w600,
                                color: AppColors.primaryTextColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 8.w),
                      Image.asset(Iconpath.lock, height: 63.h, width: 63.w),
                    ],
                  ),
                ],
              ),

          // Right Icon
        ),
        SizedBox(height: 12.h),

        // Progress Bar
        Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100.r),
                child: LinearProgressIndicator(
                  value: controller.getProgressRatio(),
                  minHeight: 16.h,
                  backgroundColor: Color(0xFFD4D4D4),
                  valueColor: AlwaysStoppedAnimation(const Color(0xFF25FF14)),
                ),
              ),
              SizedBox(height: 15.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Start',
                    style: getTextStyle(
                      fontsize: sp(12),
                      fontweight: FontWeight.w300,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  Text(
                    'Debt Free 🏆',
                    style: getTextStyle(
                      fontsize: sp(12),
                      fontweight: FontWeight.w300,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 13.h),
        // Promotion Card
        Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            color: Color(0xFFE0E0E0),
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: Color(0xFFD4D4D4), width: 1),
          ),
          child: Row(
            children: [
              Text('🚀', style: TextStyle(fontSize: 21.sp)),
              SizedBox(width: 8.w),
              Expanded(
                child: Text(
                  'You\'re in the top 35% of users who started this week. Keep going!',
                  style: getTextStyle(
                    fontsize: sp(12),
                    fontweight: FontWeight.w300,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
