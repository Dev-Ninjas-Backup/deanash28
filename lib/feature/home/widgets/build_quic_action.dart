
  import 'package:deanash_28/feature/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/common/constants/app_colors.dart';
import '../../../core/common/constants/icons_path.dart';
import '../../../core/common/style/global_text_style.dart';

Widget buildQuickActions(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: getTextStyle(
            fontsize: sp(20),
            fontweight: FontWeight.w700,
            color: AppColors.secondaryTextColor,
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                icon: Image.asset(
                  Iconpath.logDebtPayment,
                  height: 28.h,
                  width: 28.w,
                ),
                label: 'Log Debt Payment',
                onTap: () => debugPrint('Log Debt Payment tapped'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildActionButton(
                icon: Image.asset(
                  Iconpath.logIncome,
                  height: 28.h,
                  width: 28.w,
                ),
                label: 'Log Income',
                onTap: () => debugPrint('Log Income tapped'),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Row(
          children: [
            Expanded(
              child: _buildActionButton(
                icon: Image.asset(
                  Iconpath.logSavings,
                  height: 28.h,
                  width: 28.w,
                ),
                label: 'Log Savings',
                onTap: () => debugPrint('Log Savings tapped'),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: _buildActionButton(
                icon: Image.asset(
                  Iconpath.logExpense,
                  height: 28.h,
                  width: 28.w,
                ),
                label: 'Log Expense',
                onTap: () => debugPrint('Log Expense tapped'),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required Widget icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 10.w),
        decoration: BoxDecoration(
          color: Color(0xFF0C0726).withValues(alpha: .08),
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Row(
          children: [
            icon,
            SizedBox(width: 4.w),
            Text(
              label,
              style: getTextStyle(
                fontsize:sp(12),
                fontweight: FontWeight.w400,
                color: AppColors.backgroundColor
              ),
            ),
          ],
        ),
      ),
    );
  }