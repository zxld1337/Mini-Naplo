import 'package:flutter/material.dart';
import 'package:mini_naplo/constants/constants.dart';

class PageFrame extends StatelessWidget {
  final Widget child;

  const PageFrame({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.only(
          right: constHorizontalPadding,
          left: constHorizontalPadding,
          top: constVerticalPadding,
        ),
        child: child,
      ),
    );
  }
}
