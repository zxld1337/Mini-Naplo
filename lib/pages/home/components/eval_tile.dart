// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:glass_ui/constants/constants.dart';

class EvalTile extends StatelessWidget {
  final String value;
  final String topic;
  final String evalName;
  final String date;
  final Color color;

  const EvalTile({
    super.key,
    required this.value,
    required this.topic,
    required this.evalName,
    required this.date,
    required this.color,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: constBgColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(                    
                    topic,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: constFontColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: constFontFamily,
                    ),
                  ),
                  Text(
                    evalName,
                    style: TextStyle(
                      fontSize: 16,
                      color: constFontColor.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                      fontFamily: constFontFamily,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: constBgColor,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(16),
              width: 64,
              child: Center(
                child: Text(
                  value.length == 1 ? value : "!",
                  style: TextStyle(
                    fontSize: 24,
                    color: color,
                    fontWeight: FontWeight.bold,
                    fontFamily: constFontFamily,
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
