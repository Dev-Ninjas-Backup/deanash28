import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants/app_colors.dart';
import '../style/global_text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? ontap;
  final String title;
  const CustomButton({required this.title, required this.ontap, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          //  horizontal: 24.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Center(
          child: Text(
            title,
            style: getTextStyle(
              fontsize: 16.sp,
              fontweight: FontWeight.w700,
              color: AppColors.primaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
