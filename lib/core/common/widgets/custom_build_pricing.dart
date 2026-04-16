import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../style/global_text_style.dart';

Widget buildPricingOption({
  required String emoji,
  required String title,
  required String price,
  Color? bgColor,
  String? badge,
  Color? textColor,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: bgColor ?? (isSelected ? AppColors.primaryTextColor: AppColors.primaryTextColor.withValues(alpha: 0.05)),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: isSelected
              ? Color(0xFF244BE9)
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
                        color: textColor ?? (isSelected
                            ? AppColors.secondaryTextColor
                            : AppColors.primaryTextColor),
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
                  color: textColor ?? (isSelected
                      ? AppColors.secondaryTextColor
                      : AppColors.primaryTextColor),
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
