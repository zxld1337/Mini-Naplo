
import 'package:flutter/material.dart';

class ScreenBackground extends StatelessWidget {
  const ScreenBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        children: [
          const SizedBox(height: 86),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/login/ai_bg_mini.png",
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}