import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/constants/app_colors.dart';
import '../../../../core/common/style/global_text_style.dart';

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
    // final DailyTaskController controller = Get.put(
    //   DailyTaskController(),
    //   tag: 'day_$dayNumber',
    // );

    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppColors.primaryTextColor,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withValues(alpha: .10),
            offset: Offset(0, 4.h),
            blurRadius: 20.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 55.w,
                height: 55.h,
                decoration: BoxDecoration(
                  color: AppColors.secondaryTextColor,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$dayNumber',
                      style: getTextStyle(
                        fontsize: sp(14),
                        fontweight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Day',
                      style: getTextStyle(
                        fontsize: sp(10),
                        fontweight: FontWeight.w300,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
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
                              fontsize: sp(14),
                              fontweight: FontWeight.w600,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 8.h,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xFFF5F0FF),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Color(0xFFA855F7),
                                size: sp(14),
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Today',
                                style: getTextStyle(
                                  fontsize: sp(12),
                                  fontweight: FontWeight.w400,
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
          SizedBox(height: 8.h),
          Text(
            description,
            style: getTextStyle(
              fontsize: sp(12),
              fontweight: FontWeight.w300,
              color: Color(0xFF575757),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            decoration: BoxDecoration(
              color: Color(0xFF7C3AED).withValues(alpha: .12),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  Iconpath.earnXpIcon,
                  height: 14.h,
                  width: 14.w,
                  color: Color(0xFF7C3AED),
                ),
                SizedBox(width: 3.w),
                Text(
                  '+$xpReward XP',
                  style: getTextStyle(
                    fontsize: sp(10),
                    fontweight: FontWeight.w400,
                    color: Color(0xFF7C3AED),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF00FF88), Color(0xFF8935FF)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(50.r),
                  child: Center(
                    child: Text(
                      'Complete Task',
                      style: getTextStyle(
                        fontsize: sp(14),
                        fontweight: FontWeight.w600,
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
    );
  }
}
