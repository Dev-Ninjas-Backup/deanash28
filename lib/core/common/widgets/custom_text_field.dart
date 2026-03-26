import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:deanash_28/core/common/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final bool isPassword;
  final bool isPasswordVisible;
  final VoidCallback? onPasswordVisibilityToggle;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    this.isPassword = false,
    this.isPasswordVisible = false,
    this.onPasswordVisibilityToggle,
    this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !isPasswordVisible,
      keyboardType: keyboardType,
      validator: validator,
      style: getTextStyle(color: AppColors.primaryTextColor, fontsize: sp(14)),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: getTextStyle(
          fontsize: sp(14),
        ),
        prefixIcon: Icon(
          prefixIcon,
          color: AppColors.primaryTextColor,
          size: sp(18),
        ),
        suffixIcon: isPassword
            ? GestureDetector(
                onTap: onPasswordVisibilityToggle,
                child: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.primaryTextColor,
                  size: sp(18),
                ),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.primaryTextColor.withValues(alpha: 0.3),
            width: 1.w,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.primaryTextColor.withValues(alpha: 0.08),
            width: 1.w,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: AppColors.primaryTextColor,
            width: 1.5.w,
          ),
        ),
        filled: true,
        fillColor: AppColors.primaryTextColor.withValues(alpha: 0.05),
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      ),
    );
  }
}
