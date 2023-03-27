
import 'package:flutter/material.dart';
import 'package:glass_ui/utils/const_varibles.dart';

class GradeTile extends StatelessWidget {
  final String subject;
  final double avg;
  final Color avgBgColor;
  final BorderRadius bRadius;

  const GradeTile({
    super.key,
    required this.subject,
    required this.avg,
    required this.avgBgColor,
    required this.bRadius,
  });

  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 2),
      child: Container(
        decoration: BoxDecoration(
          color: constBgColor.withOpacity(0.9),
          borderRadius: bRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    subject,
                    style: TextStyle(
                      fontSize: 16,
                      color: constFontColor.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontFamily: constFontFamily,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: constBgColor,
                    borderRadius: bRadius,
                  ),
                  padding: const EdgeInsets.all(6),
                  width: 61,
                  child: Center(
                    child: Text(
                      avg.toStringAsFixed(2),
                      style: TextStyle(
                        fontSize: 20,
                        color: avgBgColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: constFontFamily,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
