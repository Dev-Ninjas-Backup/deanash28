import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/common/style/global_text_style.dart';

class PremiumTaskCard extends StatelessWidget {
  final String title;
  final String description;
  final int xpReward;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final Color? shadowColor;
  final Color? borderColor;
  final bool isActivePremiumTask;

  const PremiumTaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.xpReward,
    this.backgroundColor,
    this.shadowColor,
    this.borderColor,
    this.isActivePremiumTask = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      decoration: BoxDecoration(
        color: isActivePremiumTask
            ? backgroundColor ?? Color(0xFF00FF88).withValues(alpha: .10)
            : Color(0xFFFFFFFF),
        border: Border.all(
          color: isActivePremiumTask
              ? borderColor ?? Color(0xFF00FF88)
              : Colors.transparent,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: isActivePremiumTask
                ? shadowColor ?? Colors.transparent
                : Color(0xFF000000).withValues(alpha: .10),
            offset: Offset(0, 4.h),
            blurRadius: 16.r,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isActivePremiumTask
              ? Image.asset(
                  Iconpath.reviewLastMonthIcon,
                  height: 44.h,
                  width: 44.w,
                )
              : Image.asset(
                  Iconpath.taskIcinLockedIcon,
                  height: 44.h,
                  width: 44.w,
                ),
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
                    color: AppColors.secondaryTextColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  description,
                  style: getTextStyle(
                    fontsize: sp(12),
                    fontweight: FontWeight.w300,
                    color: Color(0xFF575757),
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 5.h,
                  ),
                  decoration: BoxDecoration(
                    color: isActivePremiumTask
                        ? Color(0xFF00B761).withValues(alpha: .12)
                        : Color(0xFFD97706).withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(50.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.flash_on,
                        color: isActivePremiumTask
                            ? Color(0xFF00B761)
                            : Color(0xFFD97706),
                        size: sp(14),
                      ),
                      Text(
                        '+$xpReward XP',
                        style: getTextStyle(
                          fontsize: sp(10),
                          fontweight: FontWeight.w400,
                          color: isActivePremiumTask
                              ? Color(0xFF00B761)
                              : Color(0xFFD97706),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
