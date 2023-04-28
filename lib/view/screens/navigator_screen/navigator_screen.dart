import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/routes/app_pages.dart';
import 'package:mini_naplo/controllers/navigator_controller.dart';
import 'package:mini_naplo/constants/view_const.dart';
import 'components/custom_navbar.dart';
//import 'package:animations/animations.dart';

class Navigator extends GetView<NavigatorController> {
  const Navigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constPageColor,
      extendBody: true,
      body: Obx(() => AppPages.getPage(controller.currentPageRoute)),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
