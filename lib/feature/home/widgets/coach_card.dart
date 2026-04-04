import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/feature/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoachCard extends StatelessWidget {
  final HomeController controller;
  const CoachCard({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryTextColor.withValues(alpha: 0.12),
            blurRadius: 20.r,
            offset: Offset(0, 0),
            spreadRadius: 0.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.asset(
                  Iconpath.friendlyIcon,
                  height: 44.h,
                  width: 44.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "AI Coach",
                    style: getTextStyle(
                      fontsize: sp(18),
                      fontweight: FontWeight.w600,
                      color: AppColors.secondaryTextColor,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(radius: 4.r, backgroundColor: Colors.green),
                      SizedBox(width: 5.w),
                      Text(
                        "Online now",
                        style: getTextStyle(
                          fontsize: sp(10),
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 18.h),

          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25.r),
                child: Image.asset(
                  Iconpath.friendlyIcon,
                  height: 13.h,
                  width: 13.w,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 5.w,),

              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.secondaryTextColor.withValues(alpha: 0.06),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(16.r),
                      bottomLeft: Radius.circular(16.r),
                      bottomRight: Radius.circular(16.r),
                    ),
                  ),
                  child: Obx(
                    () => RichText(
                      text: TextSpan(
                        style: getTextStyle(
                          fontsize: sp(12),
                          color: AppColors.secondaryTextColor,
                        ),
                        children: [
                          TextSpan(
                            text: "Hi ${controller.userName}, you're close to a ",
                          ),
                          TextSpan(
                            text: "${controller.streakCount}-day streak. ",
                            style: getTextStyle(
                              fontsize: sp(12),
                              color: Colors.redAccent,
                              fontweight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(text: "Let's keep the momentum going. 💪"),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.only(top: 6.0.h, left: 8.0.w),
            child: Obx(
              () => Text(
                controller.lastMessageTime.value,
                style: getTextStyle(
                  fontsize: sp(10),
                  color: AppColors.secondaryTextColor,
                ),
              ),
            ),
          ),
          SizedBox(height: 8.h),

          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.chat_bubble_outline, size: sp(16)),
                  label: Text("Ask AI Coach"),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.secondaryTextColor,
                    side: BorderSide(color: AppColors.secondaryTextColor),
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.buttonColor,
                    foregroundColor: AppColors.primaryTextColor,
                    shape: StadiumBorder(),
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("See Suggestion"),
                      Icon(Icons.arrow_forward, size: sp(18)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
