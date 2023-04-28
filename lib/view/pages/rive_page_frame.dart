import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/controllers/api_service.dart';
// utils
import 'dart:ui';
//import 'package:rive/rive.dart';
import 'package:mini_naplo/constants/constants.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:rive/rive.dart';

class PageFrame extends StatelessWidget {
  final String bgAsset;
  final bool needBgImage;
  final bool bottom;
  final Widget child;

  const PageFrame({
    super.key,
    required this.bgAsset,
    required this.needBgImage,
    required this.bottom,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: constBgColor,
      body: LiquidPullToRefresh(
        backgroundColor: constBgColor,
        color: Colors.deepPurple.withOpacity(0.6),
        height: 120,
        borderWidth: 2,
        animSpeedFactor: 8,
        showChildOpacityTransition: false,
        onRefresh: ApiService.to.refreshData,
        child: Stack(
          children: [
            // Only Timetable page needs
            if (needBgImage)
              Positioned(
                width: Get.width * 1.7,
                bottom: 200,
                left: 100,
                child: Image.asset(timetableBgImage),
              ),

            // Animation
            RiveAnimation.asset(bgAsset),

            // Glass effect
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: const SizedBox(),
              ),
            ),

            // Page content
            SafeArea(
              bottom: bottom,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: constHorizontalPadding,
                  left: constHorizontalPadding,
                  top: constVerticalPadding,
                ),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
