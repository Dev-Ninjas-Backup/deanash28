import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common/constants/icons_path.dart';
import '../../../core/common/widgets/custom_app_bar2.dart';

class SevenDaysPremiuPlanPage extends StatelessWidget {
  const SevenDaysPremiuPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryTextColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar2(
              leading: GestureDetector(
                onTap: () => Get.back(),
                child: Image.asset(
                  Iconpath.arrowIcon,
                  width: 40.w,
                  height: 40.h,
                ),
              ),

              title: Text(
                'Daily Plan',
                style: getTextStyle(
                  fontsize: sp(22),
                  fontweight: FontWeight.w600,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF0B100), Color(0xFFFF6900)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(25.r),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFFB7E01).withValues(alpha: .5),
                      offset: Offset(0.w, 4.h),
                      blurRadius: 16.r,
                      spreadRadius: 0.r,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.workspace_premium,
                      color: Colors.white,
                      size: sp(16),
                    ),
                    SizedBox(width: 6.w),
                    Text(
                      'Upgrade',
                      style: getTextStyle(
                        color: Colors.white,
                        fontweight: FontWeight.w600,
                        fontsize: sp(14),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Center(
              child: Text(
                '7 Days Premium Plan Content Goes Here',
                style: TextStyle(
                  color: const Color.fromARGB(255, 5, 0, 0),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
