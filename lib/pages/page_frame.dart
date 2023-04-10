// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/services/controllers/api_service.dart';
// utils
import 'dart:ui';
import 'package:rive/rive.dart';
import 'package:mini_naplo/constants/constants.dart';


class PageFrame extends StatelessWidget {
  final String bgAsset;
  final Widget bgImage;
  final bool bottom;
  final Widget child;

  const PageFrame({
    super.key,
    required this.bgAsset,
    required this.bgImage,
    required this.bottom,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: constBgColor,
      body: RefreshIndicator(
        displacement: 50,
        backgroundColor: constFontColor.withOpacity(0.06),
        color: Colors.deepPurple.withOpacity(0.6),
        strokeWidth: 3,
        onRefresh: Get.find<ApiService>().refreshData,
        child: Stack(
          children: [
        
            // Only Timetable page needs 
            bgImage,
        
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
