import 'package:flutter/material.dart';
import 'package:glass_ui/constants/constants.dart';

class SquareTile extends StatelessWidget {
  final Color bgColor;
  final String text1;
  final String text2;
  final String hours;

  const SquareTile({
    super.key,
    required this.bgColor,
    required this.text1,
    required this.text2,
    required this.hours,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 140,
        width: 170,
        color: bgColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  text1,
                  style: const TextStyle(
                    fontFamily: constFontFamily,
                    color: constFontColor,
                    fontSize: 20,
                  ),
                ),
                Text(
                  text2,
                  style: const TextStyle(
                    fontFamily: constFontFamily,
                    color: constFontColor,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(
              "$hours óra",
              style: const TextStyle(
                fontFamily: constFontFamily,
                color: constFontColor,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
