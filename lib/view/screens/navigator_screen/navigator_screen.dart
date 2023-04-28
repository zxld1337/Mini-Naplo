import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/routes/app_pages.dart';
import 'package:mini_naplo/controllers/navigator_controller.dart';
import 'package:mini_naplo/constants/view_const.dart';
import 'components/custom_navbar.dart';


class Navigator extends GetView<NavigatorController> {
  const Navigator({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Obx(
        () => PageTransitionSwitcher(
          transitionBuilder: (child, animation, secondaryAnimation) {
            return FadeThroughTransition(
              fillColor: constBgColor,
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          duration: const Duration(milliseconds: 300),
          child: AppPages.getPage(controller.currentPageRoute),
        ),
      ),
      bottomNavigationBar: const CustomNavbar(),
    );
  }
}
