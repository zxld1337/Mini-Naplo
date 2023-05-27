import 'package:flutter/material.dart';
import 'package:mini_naplo/constants/constants.dart';

class NoLessionTile extends StatelessWidget {
  final String text;
  final Color bgColor;

  const NoLessionTile({
    super.key,
    required this.text,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: bgColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(16), 
        ),
        child: Row(
          children: [
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 20,
                      color: constFontColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: constFontFamily,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
