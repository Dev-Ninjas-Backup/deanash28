import 'package:deanash_28/feature/plan/seven_days_premium/controller/seven_days_plan_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/common/constants/app_colors.dart';
import '../../../../core/common/style/global_text_style.dart';

class OverallProgressCard extends StatelessWidget {
  const OverallProgressCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SevenDaysPlanController());

    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withValues(alpha: .12),
            offset: Offset(0, 0.h),
            blurRadius: 20.r,
            spreadRadius: 0.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Overall Progress',
                style: getTextStyle(
                  fontsize: sp(20),
                  fontweight: FontWeight.w700,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              Obx(
                () => Text(
                  '${controller.progressPercentage.toStringAsFixed(0)}%',
                  style: getTextStyle(
                    fontsize: sp(20),
                    fontweight: FontWeight.w700,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Obx(
            () => ClipRRect(
              borderRadius: BorderRadius.circular(50.r),
              child: Container(
                height: 10.h,
                width: double.infinity,
                color: AppColors.secondaryTextColor.withValues(alpha: .10),
                child: Container(
                  height: 10.h,
                  decoration: BoxDecoration(
                    color: Color(0xFFE8E8F0),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: controller.progressPercentage / 100,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF00FF88), Color(0xFF8935FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 12.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Obx(
                () => Text(
                  '${controller.earnedXP.value.toInt()} XP earned',
                  style: getTextStyle(
                    fontsize: sp(12),
                    fontweight: FontWeight.w300,
                    color: Color(0xFF575757),
                  ),
                ),
              ),
              Obx(
                () => Text(
                  '${controller.remainingXP.toInt()} XP remaining',
                  style: getTextStyle(
                    fontsize: sp(12),
                    fontweight: FontWeight.w300,
                    color: Color(0xFF575757),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
