import 'package:deanash_28/feature/home/screem/home_page.dart';
import 'package:deanash_28/feature/plan/seven_days_premium/screen/seven_days_premiu_plan_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navbar_controller.dart';
import 'navbar.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key});
  @override
  Widget build(BuildContext context) {
    final NavController controller = Get.put(NavController());
    final List<Widget> screens = [
      HomePage(),
      SevenDaysPremiuPlanPage(),
      HomePage(),
      SevenDaysPremiuPlanPage(),
      HomePage(),
      SevenDaysPremiuPlanPage(),
    ];
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.selectedIndex.value,
          children: screens,
        ),
      ),
      bottomNavigationBar: FloatingNavbar(),
      // extendBody:
      //     false,
    );
  }
}
