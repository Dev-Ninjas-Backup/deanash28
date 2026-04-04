import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart' show Iconpath;
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/feature/home/widgets/build_mission_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../controller/home_controller.dart';
import '../widgets/debt_freedom_progress.dart';
import '../widgets/level_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize HomeController
    final controller = Get.put(HomeController());

    return Scaffold(
      backgroundColor: AppColors.primaryTextColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            PreferredSize(
              preferredSize: Size.fromHeight(80.h),
              child: CustomAppBar(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  levelHome(),
                  SizedBox(height: 16.h),
                  buildMissionCard(),
                  SizedBox(height: 24.h),
                  debtFreedomProgress(controller),
                  SizedBox(height: 16.h),
                  buildQuickActions(controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildQuickActions(HomeController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: getTextStyle(
            fontsize: 20.sp,
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
      //  mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            SizedBox(width: 4.w),
            Text(
              label,
              style: getTextStyle(
                fontsize: 12.sp,
                fontweight: FontWeight.w400,
                color: AppColors.backgroundColor
              ),
            ),
          ],
        ),
      ),
    );
  }
}
