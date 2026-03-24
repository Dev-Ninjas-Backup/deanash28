import 'package:deanash_28/core/common/constants/app_colors.dart';
import 'package:deanash_28/core/common/constants/icons_path.dart';
import 'package:deanash_28/core/common/style/global_text_style.dart';
import 'package:deanash_28/core/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,

      body: gradientBackground(
        SingleChildScrollView(
          child: Center(
            child: Column(
            //  crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              SizedBox(height: 100.h,),
                Image.asset(Iconpath.groupLogo, width: 345.w, height: 155.h),
                SizedBox(height: 76.h,),
                Text("Get Signed in.", style: getTextStyle(fontsize: 25.sp, fontweight: FontWeight.w700),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
