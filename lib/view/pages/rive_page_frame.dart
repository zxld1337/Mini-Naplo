import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/constants/constants.dart';
import 'package:rive/rive.dart';

class PageFrame extends StatelessWidget {
  final String bgAsset;
  final bool needBgImage;
  final Widget child;

  const PageFrame({
    super.key,
    required this.bgAsset,
    required this.needBgImage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: constBgColor,
      body: Stack(
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
            bottom: false,
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
    );
  }
}
