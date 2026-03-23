import 'dart:ui';
import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
SizedBox gradientBackground(Widget? widgets) {
    return SizedBox(
      height: 851.h,
      width: 393.w,
      child: Stack(
        children: [
          Positioned(
            top: -146.h,
            left: -146.w,
            child: _buildGlow(
              321.h,
              321.w,
              AppColors.bacgroundPositioncolor,
              150.w,
              150.h,
            ),
          ),
          Positioned(
            top: 313.h,
            left: 298.w,
            child: _buildGlow(
              190.h,
              190.w,
              AppColors.bacgroundPositioncolor.withValues(alpha: .60.sp),
              240.w,
              240.h,
            ),
          ),
          Positioned(
            top: 723.h,
            left: 54.w,
            child: _buildGlow(
              285.h,
              285.w,
              AppColors.bacgroundPositioncolor.withValues(alpha: .25.sp),
              150.w,
              150.h,
            ),
          ),
          widgets ?? SizedBox.shrink(),
        ],
      ),
    );
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
          shape: BoxShape.rectangle,
          gradient: RadialGradient(
            colors: [color, color, color, color, Colors.transparent],
          ),
        ),
      ),
    );
  }
