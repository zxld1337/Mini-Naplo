import 'package:flutter/material.dart';
import 'package:glass_ui/constants/constants.dart';

class InfoTile extends StatelessWidget {
  final String hintText;
  final String data;

  const InfoTile({
    super.key,
    required this.hintText,
    required this.data,
  });

  static const double borderRadius = 12;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Container(
        decoration: BoxDecoration(
          color: constBgColor.withOpacity(0.7),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                hintText,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: constFontFamily,
                  height: 1,
                  color: constFontColor.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                data,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: constFontFamily,
                  height: 1,
                  color: constFontColor,
                ),                
              ),
              Row(),
            ],
          ),
        ),
      ),
    );
  }
}
