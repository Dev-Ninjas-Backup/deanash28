import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/feature/home/widgets/build_mission_card.dart';
import 'package:deanash_28/feature/home/widgets/coach_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/widgets/custom_app_bar.dart';
import '../controller/home_controller.dart';
import '../widgets/build_quic_action.dart';
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
                  SizedBox(height: 16.h),
                  CoachCard(controller: controller),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
