import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/feature/home/widgets/build_mission_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/constants/custom_app_bar.dart';
import '../widgets/level_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(height: 16.h),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
