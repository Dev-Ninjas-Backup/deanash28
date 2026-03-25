import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/common/widgets/custom_button.dart';
import '../../../routes/app_routes.dart';

class OnboardingScreen1 extends StatelessWidget {
  const OnboardingScreen1({super.key});

  // late final OnboardingController controller =
  //     Get.isRegistered<OnboardingController>()
  //     ? Get.find<OnboardingController>()
  //     : Get.put(OnboardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: gradientBackground(
        SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(height: 140.h),
                      Image.asset(
                        Iconpath.groupLogo,
                        width: 345.w,
                        height: 155.h,
                      ),
                      SizedBox(height: 50.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20.w,
                          vertical: 22.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryTextColor.withValues(
                            alpha: 0.05,
                          ),
                          border: Border.all(
                            color: AppColors.primaryTextColor.withValues(
                              alpha: 0.08,
                            ),
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                "Level up your money",
                                textAlign: TextAlign.center,
                                style: getTextStyle(
                                  fontsize: sp(25),
                                  color: AppColors.primaryTextColor,
                                  fontweight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Text(
                                "Your AI Personal Money Trainer. Hit your daily check-in. Build your streak. Get your money under control - one action at a time.",
                                textAlign: TextAlign.center,
                                style: getTextStyle(
                                  fontsize: sp(14),
                                  fontweight: FontWeight.w300,
                                  color: Color(0xFFC2C2C2),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 15.w,
                                  vertical: 14.h,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.primaryTextColor,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Image.asset(
                                      Iconpath.earnXpIcon,
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "Earn XP",
                                      style: getTextStyle(
                                        fontsize: sp(16),
                                        fontweight: FontWeight.w600,
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Image.asset(
                                      Iconpath.dotIcon,
                                      height: 8.h,
                                      width: 8.w,
                                    ),
                                    SizedBox(width: 20.w),
                                    Image.asset(
                                      Iconpath.trackIcon,
                                      height: 20.h,
                                      width: 20.w,
                                    ),
                                    SizedBox(width: 8.w),
                                    Text(
                                      "Track Streaks",
                                      style: getTextStyle(
                                        fontsize: sp(16),
                                        fontweight: FontWeight.w600,
                                        color: AppColors.secondaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),

                CustomButton(
                  title: "Get Started",
                  ontap: () {
                    Get.toNamed(AppRoute.getOnboardingScreen2());
                  },
                ),
                SizedBox(height: 30.h),
                Text(
                  "Join thousands improving their money habits daily",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getTextStyle(
                    fontsize: sp(14),
                    fontweight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
