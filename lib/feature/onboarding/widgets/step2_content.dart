 import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/style/global_text_style.dart';
import '../../../core/common/widgets/custom_text_field.dart';
import '../controller/onboarding_controller.dart';

Widget buildStep2Content(OnboardingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Monthly Income:",
          style: getTextStyle(fontsize: sp(16), fontweight: FontWeight.w700),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          hintText: "Enter amount",
          prefixIcon: Icons.attach_money,
          controller: controller.monthlyIncomeController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 14.h),
        Text(
          "Total Debt Amount:",
          style: getTextStyle(fontsize: sp(16), fontweight: FontWeight.w700),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          hintText: "Enter amount",
          prefixIcon: Icons.attach_money,
          controller: controller.totalDebtController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 14.h),
        Text(
          "Current Balance:",
          style: getTextStyle(fontsize: sp(16), fontweight: FontWeight.w700),
        ),
        SizedBox(height: 8.h),
        CustomTextField(
          hintText: "Enter amount",
          prefixIcon: Icons.attach_money,
          controller: controller.currentBalanceController,
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 14.h),
      ],
    );
  }
