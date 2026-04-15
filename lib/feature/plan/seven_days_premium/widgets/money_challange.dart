  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/common/constants/app_colors.dart';
import '../../../../core/common/constants/icons_path.dart';
import '../../../../core/common/style/global_text_style.dart';

Widget moneyChallange() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "7-Day Money Challenge",
          style: getTextStyle(
            fontsize: sp(22),
            fontweight: FontWeight.w700,
            color: AppColors.secondaryTextColor,
          ),
        ),
        Text(
          "Build your money habits one day at a time",
          style: getTextStyle(
            fontsize: sp(12),
            fontweight: FontWeight.w300,
            color: AppColors.secondaryTextColor,
          ),
        ),
        SizedBox(height: 12.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildStatCard(
              icon: Iconpath.completedIcon,
              value: '1/7',
              label: 'Completed',
            ),
            _buildStatCard(
              icon: Iconpath.xpEarnIcon,
              value: '25',
              label: 'XP Earned',
            ),
            _buildStatCard(
              icon: Iconpath.dayLeftIcon,
              value: '2/7',
              label: 'Days Left',
            ),
          ],
        ),
      ],
    );
  }

   Widget _buildStatCard({
    required String icon,
    required String value,
    required String label,
  }) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 7.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: AppColors.secondaryTextColor.withValues(alpha: 0.06),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.secondaryTextColor.withValues(alpha: 0.12),
            width: 1.w,
          ),
        ),
        child: Column(
          children: [
            Image.asset(icon, width: 40.w, height: 40.h),
            SizedBox(height: 4),
            Text(
              value,
              style: getTextStyle(
                fontsize: sp(24),
                fontweight: FontWeight.w600,
                color: AppColors.secondaryTextColor,
              ),
            ),
            Text(
              label,
              style: getTextStyle(
                fontsize: sp(12),
                fontweight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }