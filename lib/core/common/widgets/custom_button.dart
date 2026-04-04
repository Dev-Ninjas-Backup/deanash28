import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../style/global_text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? ontap;
  final String title;
  final Color? buttonColor;
  final Color? textColor;
  final double? width;
  final double? height;
final double? horizontalPadding;
  final double? verticalPadding;
  final double? fontSize;
  const CustomButton({
    required this.title,
    required this.ontap,
    super.key,
    this.buttonColor,
    this.textColor,
    this.width,
    this.height,
    this.verticalPadding,
    this.fontSize, this.horizontalPadding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: width ?? double.infinity,
        height: height,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0.w,
          vertical: verticalPadding ?? 10.h,
        ),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.buttonColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Center(
          child: Text(
            title,
            style: getTextStyle(
              fontsize: sp(fontSize ?? 16),
              fontweight: FontWeight.w700,
              color: textColor ?? AppColors.primaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
