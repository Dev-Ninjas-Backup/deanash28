import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/common/constants/icons_path.dart';
import '../controller/navbar_controller.dart';

class FloatingNavbar extends StatelessWidget {
  final NavController controller = Get.put(NavController());
  final List<Map<String, dynamic>> items = [
    {'icon': Iconpath.homeIcon, 'label': 'Home'},
    {'icon': Iconpath.planIcon, 'label': 'Plan'},
    {'icon': Iconpath.progressIcon, 'label': 'Progress'},
    {'icon': Iconpath.spendingIcon, 'label': 'Spending'},
    {'icon': Iconpath.coachIcon, 'label': 'Coach'},
    {'icon': Iconpath.profileNavIcon, 'label': 'Profile'},
  ];
  FloatingNavbar({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
       margin: EdgeInsets.only(bottom: 25.h, left: 16.w, right: 16.w),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            bool isSelected = controller.selectedIndex.value == index;
            return GestureDetector(
              onTap: () => controller.changeIndex(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsets.symmetric(
                  horizontal: isSelected ? 10.w : 8.w,
                  vertical: 8.h,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Color(0xFF39FF14).withValues(alpha: .2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(30.r),
                ),
                child: Row(
                  children: [

                    Image.asset(
                      items[index]['icon'],
                      width: 24.w,
                      height: 24.h,
                      color: isSelected ? Colors.greenAccent : Colors.white,
                    ),
                    if (isSelected) ...[
                      SizedBox(width: 5.w),
                      Text(
                        items[index]['label'],
                        style: getTextStyle(
                          color: Colors.white,
                          fontweight: FontWeight.w400,
                          fontsize:sp(16),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
