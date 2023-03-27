// ignore_for_file: prefer_const_constructors, must_be_immutable
import 'package:flutter/material.dart';
// consts
import 'package:glass_ui/utils/const_varibles.dart';

class LessionTile extends StatelessWidget {
  final String name;
  final String subNumber;
  final String teacher;
  final String roomId;
  final String fromTime;
  final String tillTime;
  final Color bgColor;
  final String icon;

  const LessionTile({
    super.key,
    required this.name,
    required this.subNumber,
    required this.teacher,
    required this.roomId,
    required this.fromTime,
    required this.tillTime,
    required this.bgColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    // default consts
    const double borderRadius = 16;
    final imageBackground = constFontColor.withOpacity(0.1);
    final tileBackground = bgColor.withOpacity(0.7);

    // Glass effect Widget repr
    return Container(
      decoration: BoxDecoration(
        color: tileBackground,
        borderRadius: BorderRadius.circular(borderRadius), 
      ),
      
      // Subject tile layout
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  // Subject number
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "$subNumber.",
                      style: TextStyle(
                        fontSize: 22,
                        color: constFontColor,
                        fontWeight: FontWeight.bold,
                        fontFamily: constFontFamily,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Subject name
                      Text(
                        name[0].toUpperCase() + name.substring(1).toLowerCase(),
                        style: TextStyle(
                          fontSize: 22,
                          color: constFontColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: constFontFamily,
                        ),
                      ),
                      SizedBox(height: 1),
                      // Time interval
                      Text(
                        "$fromTime - $tillTime",
                        style: TextStyle(
                          fontSize: 14,
                          color: constFontColor.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          fontFamily: constFontFamily,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // right side image
              Container(
                decoration: BoxDecoration(
                  color: imageBackground,
                  borderRadius: BorderRadius.circular(borderRadius), // 30
                ),
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  icon,
                  height: 40, //80,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
