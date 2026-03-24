import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../style/global_text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? ontap;
  final String title;
  final Color? buttonColor;
  final Color? textColor;
  const CustomButton({required this.title, required this.ontap, super.key, this.buttonColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          //  horizontal: 24.w,
          vertical: 10.h,
        ),
        decoration: BoxDecoration(
          color: buttonColor ?? AppColors.buttonColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Center(
          child: Text(
            title,
            style: getTextStyle(
              fontsize: sp(16),
              fontweight: FontWeight.w700,
              color: textColor ?? AppColors.primaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
