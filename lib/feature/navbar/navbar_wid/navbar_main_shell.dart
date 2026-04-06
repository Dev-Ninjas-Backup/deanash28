import 'package:deanash_28/feature/home/screem/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/navbar_controller.dart';
import 'navbar.dart';

class MainShell extends StatelessWidget {
  final NavController controller = Get.put(NavController());
  final List<Widget> screens = [HomePage()];
  MainShell({super.key});
  @override
  Widget build(BuildContext context) {
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
