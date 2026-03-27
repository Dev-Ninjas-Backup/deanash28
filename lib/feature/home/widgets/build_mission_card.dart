import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/custom_button.dart';
import 'package:deanash_28/core/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildMissionCard() {
  return ClipRRect(
    borderRadius: BorderRadius.circular(20.r),
    child: Container(
      // padding: EdgeInsets.all(25.w),
      decoration: BoxDecoration(color: const Color(0xFF06190A)),
      child: Stack(
        children: [
          Positioned(
            right: -30.w,
            bottom: -40.h,
            child: buildGlow(
              154.h,
              154.w,
              AppColors.bacgroundPositioncolor,
              144.w,
              144.h,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF05FF8A).withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            Iconpath.earnXpIcon,
                            height: 14.h,
                            width: 14.w,
                            color: Color(0xFF05FF8A),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            '+25 XP',
                            style: getTextStyle(
                              fontsize: sp(10),
                              fontweight: FontWeight.w400,
                              color: const Color(0xFF25FF14),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 11.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.primaryTextColor.withValues(
                          alpha: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Row(
                        children: [
                          Text('⏱️', style: getTextStyle(fontsize: sp(10))),
                          SizedBox(width: 4.w),
                          Text(
                            '30 Sec',
                            style: getTextStyle(
                              fontsize: sp(10),
                              fontweight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  'Today\'s Money Mission',
                  style: getTextStyle(
                    fontsize: sp(12),
                    fontweight: FontWeight.w300,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                SizedBox(height: 8.h),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [const Color(0xFF2AFF83), const Color(0xFFFFFFFF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ).createShader(bounds),
                  child: Text(
                    'Track your first debt',
                    style: getTextStyle(
                      fontsize: sp(28),
                      fontweight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                // Button
                CustomButton(title: "Start Today's Check-In  ➔ ", ontap: () {}),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
