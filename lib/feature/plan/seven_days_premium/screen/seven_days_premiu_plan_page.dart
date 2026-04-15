import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/common/constants/icons_path.dart';
import '../../../../core/common/widgets/custom_app_bar2.dart';
import '../widgets/money_challange.dart';
import '../widgets/daily_task_card.dart';
import '../widgets/overall_progress_card.dart';
import '../widgets/premium_task_card.dart';

class SevenDaysPremiuPlanPage extends StatelessWidget {
  const SevenDaysPremiuPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryTextColor,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  moneyChallange(),
                  SizedBox(height: 13.h),
                  OverallProgressCard(),

                  SizedBox(height: 13.h),

                  PremiumTaskCard(
                    isActivePremiumTask: true,
                    title: 'Review last month\'s expenses',
                    description: 'Identify your top 3 spending categories',
                    xpReward: 25,
                  ),

                  SizedBox(height: 24.h),
                  DailyTaskCard(
                    dayNumber: 2,
                    title: 'Track all your spending today',
                    description:
                        'Write down every expense, no matter how small',
                    xpReward: 25,
                    onCompleted: () {},
                  ),
                  SizedBox(height: 13.h),

                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 13.h),
                        child: PremiumTaskCard(
                          isActivePremiumTask: false,
                          title: 'Review last month\'s expenses',
                          description:
                              'Identify your top 3 spending categories',
                          xpReward: 25,
                          backgroundColor: Color(
                            0xFF00FF88,
                          ).withValues(alpha: .10),
                        ),
                      );
                    },
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    physics: NeverScrollableScrollPhysics(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
