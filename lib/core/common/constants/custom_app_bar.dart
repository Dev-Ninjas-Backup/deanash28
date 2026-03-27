import 'dart:ui';

import 'package:deanash_28/core/common/constants/app_colors.dart' show AppColors;
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../style/global_text_style.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.r),
        bottomRight: Radius.circular(30.r),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
          color: Color(0xFF39FF14).withValues(alpha: .008),
          border: Border(
            left: BorderSide(
              color: AppColors.primaryTextColor.withValues(alpha: 0.08),
              width: 2,
            ),
            right: BorderSide(
              color: AppColors.primaryTextColor.withValues(alpha: 0.08),
              width: 2,
            ),
            bottom: BorderSide(
              color: AppColors.primaryTextColor.withValues(alpha: 0.08),
              width: 2,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30.h,
              left: 20.w,
              right: 10.w,

              // left: 1.w,
              child: _buildGlow(
                327.h,
                3327.w,
                Color(0xFF39FF14).withValues(alpha: .45),
                200.w,
                200.h,
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipOval(
                      child: Image.asset(
                        Iconpath.friendlyIcon,
                        height: 50.h,
                        width: 50.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Hi, Alex 👋',
                            style: getTextStyle(
                              fontsize: sp(22),
                              fontweight: FontWeight.w700,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          Text(
                            'Welcome back',
                            style: getTextStyle(
                              fontsize: sp(14),
                              fontweight: FontWeight.w300,
                              color: AppColors.secondaryTextColor.withValues(
                                alpha: .9,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // XP Badge
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '00+ XP',
                          style: getTextStyle(
                            fontsize: sp(16),
                            fontweight: FontWeight.w600,
                            color: AppColors.secondaryTextColor,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Image.asset(
                          Iconpath.dartIcon,
                          height: 30.h,
                          width: 30.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildGlow(
  double height,
  double width,
  Color color,
  double sigmax,
  double sigmay,
) {
  return ImageFiltered(
    imageFilter: ImageFilter.blur(sigmaX: sigmax, sigmaY: sigmay),
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color, color, color, Colors.transparent],
        ),
      ),
    ),
  );
}
