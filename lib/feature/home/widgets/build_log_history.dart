import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/common/constants/app_colors.dart';
import '../../../core/common/constants/icons_path.dart';
import '../../../core/common/style/global_text_style.dart';
import '../controller/home_controller.dart';

Widget buildLogHistory(HomeController controller) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Your Log History',
            style: getTextStyle(
              fontsize:sp(20),
              fontweight: FontWeight.w700,
              color: AppColors.secondaryTextColor,
            ),
          ),
          GestureDetector(
            onTap: () => debugPrint('See all tapped'),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 7.h),
              decoration: BoxDecoration(
                color: AppColors.secondaryTextColor.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Text(
                'See All >',
                style: getTextStyle(
                  fontsize: sp(12),
                  fontweight: FontWeight.w300,
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 12.h),
      Obx(
        () => ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: controller.transactionHistory.length,
          separatorBuilder: (context, index) => SizedBox(height: 12.h),
          itemBuilder: (context, index) {
            final transaction = controller.transactionHistory[index];
            return Padding(
              padding:  EdgeInsets.only(bottom: 4.h),
              child: buildTransactionCard(transaction),
            );
          },
        ),
      ),
    ],
  );
}

Widget buildTransactionCard(dynamic transaction) {
  String categoryIcon = '';
  Color categoryColor = Colors.grey;

  switch (transaction.category) {
    case 'Debt Paid':
      categoryIcon = Iconpath.logHistoryDebtDebit;
      categoryColor = Color(0xFFFF6B6B);
      break;
    case 'Savings':
      categoryIcon = Iconpath.logHistorySavings;
      categoryColor = Color(0xFF51CF66);
      break;
    case 'Income':
      categoryIcon = Iconpath.logHistoryIncome;
      categoryColor = Color(0xFF4DABF7);
      break;
    case 'Expense':
      categoryIcon = Iconpath.logHistoryDebtDebit;
      categoryColor = Color(0xFFFFA500);
      break;
  }

  return Row(
    children: [
      Image.asset(categoryIcon, height: 34.h, width: 34.w),

      SizedBox(width: 12.w),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              transaction.amount < 0
                  ? '- \$${transaction.amount.abs()}'
                  : '+ \$${transaction.amount}',
              style: getTextStyle(
                fontsize: sp(14),
                fontweight: FontWeight.w500,
                color: AppColors.secondaryTextColor,
              ),
            ),
            Text(
              transaction.description,
              style: getTextStyle(
                fontsize: sp(12),
                fontweight: FontWeight.w400,
                color: AppColors.secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            children: [
              Text(
                '+${transaction.xpGained} XP',
                style: getTextStyle(
                  fontsize: sp(12),
                  fontweight: FontWeight.w600,
                  color: AppColors.secondaryTextColor,
                ),
              ),
              SizedBox(width: 4.w),
              Image.asset(
                Iconpath.xpIcon,
                height: 12.h,
                width: 12.w,
                color: categoryColor,
              ),
            ],
          ),
          Text(
            transaction.category,
            style: getTextStyle(
              fontsize: sp(10),
              fontweight: FontWeight.w300,
              color: categoryColor,
            ),
          ),
        ],
      ),
    ],
  );
}
