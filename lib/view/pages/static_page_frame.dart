import 'package:flutter/material.dart';
import 'package:mini_naplo/controllers/api_service.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mini_naplo/constants/constants.dart';
// utils

class PageFrame extends StatelessWidget {
  final bool bottom;
  final Widget child;

  const PageFrame({
    super.key,
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
        child: SafeArea(
          
          child: Padding(
            padding: const EdgeInsets.only(
              right: constHorizontalPadding,
              left: constHorizontalPadding,
              top: constVerticalPadding,
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
