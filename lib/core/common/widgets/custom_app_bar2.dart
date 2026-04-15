import 'dart:ui';

import 'package:deanash_28/core/common/constants/app_colors.dart'
    show AppColors;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar2 extends StatelessWidget {
  final Widget? leading;
  final Widget? title;
  final Widget? trailing;

  const CustomAppBar2({super.key, this.leading, this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(30.r),
        bottomRight: Radius.circular(30.r),
      ),
      child: Container(
      margin: EdgeInsets.only(left: 6.w, right: 6.w),
        //  padding: EdgeInsets.symmetric(horizontal: 20.w),
        decoration: BoxDecoration(
          color: Color(0xFF39FF14).withValues(alpha: .008),
          border: Border(
            left: BorderSide(
              color: AppColors.primaryTextColor.withValues(alpha: 0.08),
              width: 2.w,
            ),
            right: BorderSide(
              color: AppColors.primaryTextColor.withValues(alpha: 0.08),
              width: 2.w,
            ),
            bottom: BorderSide(
              color: AppColors.primaryTextColor.withValues(alpha: 0.08),
              width: 2.w,
            ),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 30.h,
              left: 20.w,
              right: 10.w,
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
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (leading != null) leading! else SizedBox(width: 40.w),
                    if (title != null) Center(child: title!) else Spacer(),
                    if (trailing != null) trailing! else SizedBox(width: 40.w),
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
