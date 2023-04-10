
import 'package:flutter/material.dart';
import 'package:mini_naplo/constants/view_const.dart';


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
                loginBodyImage,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
        ],
      ),
    );
  }
}