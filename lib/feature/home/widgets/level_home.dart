  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/common/constants/app_colors.dart';
import '../../../core/common/style/global_text_style.dart';

Widget levelHome() {
    return Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF0C0726).withValues(alpha: .1),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: Colors.white.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('🔥', style: getTextStyle(fontsize: sp(20))),
                          SizedBox(width: 4.w),
                          Text(
                            '01',
                            style: getTextStyle(
                              fontsize: sp(22),
                              fontweight: FontWeight.w700,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'days streak',
                            style: getTextStyle(
                              fontsize: sp(14),
                              fontweight: FontWeight.w300,
                              color: AppColors.secondaryTextColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 7.w,
                          vertical: 5.h,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFF0C0726).withValues(alpha: .12),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.r),
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: sp(18),
                              color: AppColors.secondaryTextColor,
                            ),
                            SizedBox(width: 6.w),
                            Text(
                              'Level 1',
                              style: getTextStyle(
                                fontsize: sp(14),
                                fontweight: FontWeight.w300,
                                color: AppColors.secondaryTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
  }