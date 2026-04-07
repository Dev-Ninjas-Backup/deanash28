import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common/constants/app_colors.dart';
import '../../../core/common/style/global_text_style.dart';
import '../controller/daily_task_controller.dart';

class DailyTaskCard extends StatelessWidget {
  final int dayNumber;
  final String title;
  final String description;
  final int xpReward;
  final VoidCallback? onCompleted;

  const DailyTaskCard({
    super.key,
    required this.dayNumber,
    required this.title,
    required this.description,
    required this.xpReward,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    final DailyTaskController controller = Get.put(
      DailyTaskController(),
      tag: 'day_$dayNumber',
    );

    return Obx(
      () => Container(
        padding: EdgeInsets.all(14.w),
        decoration: BoxDecoration(
          color: AppColors.secondaryTextColor.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(20.r),

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Day badge and Title with Today badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Day badge
                Container(
                  width: 60.w,
                  height: 60.h,
                  decoration: BoxDecoration(
                    color: Color(0xFF1E1B4B),
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$dayNumber',
                        style: getTextStyle(
                          fontsize: sp(24),
                          fontweight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Day',
                        style: getTextStyle(
                          fontsize: sp(12),
                          fontweight: FontWeight.w400,
                          color: Colors.white.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                // Title and Today badge
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: getTextStyle(
                                fontsize: sp(20),
                                fontweight: FontWeight.w700,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.w,
                              vertical: 6.h,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFE9D5FF),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.local_fire_department,
                                  color: Color(0xFFA855F7),
                                  size: 14.sp,
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  'Today',
                                  style: getTextStyle(
                                    fontsize: sp(12),
                                    fontweight: FontWeight.w600,
                                    color: Color(0xFFA855F7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            // Description
            Text(
              description,
              style: getTextStyle(
                fontsize: sp(14),
                fontweight: FontWeight.w400,
                color: AppColors.secondaryTextColor.withOpacity(0.7),
              ),
            ),
            SizedBox(height: 16.h),
            // XP Badge
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 10.h,
              ),
              decoration: BoxDecoration(
                color: Color(0xFFE9D5FF),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.flash_on,
                    color: Color(0xFFA855F7),
                    size: 16.sp,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '+$xpReward XP',
                    style: getTextStyle(
                      fontsize: sp(14),
                      fontweight: FontWeight.w600,
                      color: Color(0xFFA855F7),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.h),
            // Complete Task Button
            SizedBox(
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF00D9FF),
                      Color(0xFF0EA5E9),
                      Color(0xFF7C3AED),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(28.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF7C3AED).withOpacity(0.3),
                      offset: Offset(0, 4.h),
                      blurRadius: 12.r,
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: controller.isCompleted.value
                        ? null
                        : () {
                            controller.completeTask();
                            onCompleted?.call();
                          },
                    borderRadius: BorderRadius.circular(28.r),
                    child: Center(
                      child: Text(
                        controller.isCompleted.value
                            ? 'Task Completed ✓'
                            : 'Complete Task',
                        style: getTextStyle(
                          fontsize: sp(16),
                          fontweight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
