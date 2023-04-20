// ignore_for_file: prefer_const_constructors
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// components
import 'package:mini_naplo/routes/app_pages.dart';
import '../../services/controllers/frame_controller.dart';
import '../../constants/view_const.dart';
import 'components/custom_navbar.dart';

class MainFrame extends GetView<FrameController> {
  const MainFrame({super.key});

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
      bottomNavigationBar: CustomNavbar(),
    );
  }
}
