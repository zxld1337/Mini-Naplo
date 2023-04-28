import 'package:flutter/material.dart';
// utils
import 'package:mini_naplo/constants/constants.dart';

class AbsencesTile extends StatelessWidget {
  final String name;
  final String hours;
  final String icon;
  final Color bgColor;

  const AbsencesTile({
    super.key,
    required this.name,
    required this.hours,
    required this.icon,
    required this.bgColor,
  });

  static const double borderRadius = 16;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor.withOpacity(0.7),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Absences hours 
                        Text(
                          hours,
                          style: const TextStyle(
                            fontSize: 24,
                            color: constFontColor,
                            fontWeight: FontWeight.bold,
                            fontFamily: constFontFamily,
                          ),
                        ),
                        // Hour text
                        Text(
                          "Óra",
                          style: TextStyle(
                            fontSize: 10,
                            color: constFontColor.withOpacity(0.5),
                            fontWeight: FontWeight.bold,
                            fontFamily: constFontFamily,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Subject name
                  Text(
                    name[0].toUpperCase() + name.substring(1).toLowerCase(),
                    style: const TextStyle(
                      fontSize: 16,
                      color: constFontColor,
                      fontWeight: FontWeight.bold,
                      fontFamily: constFontFamily,
                    ),
                  ),
                ],
              ),
              // Image icon
              Container(
                decoration: BoxDecoration(
                  color: bgColor.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(borderRadius), // 30
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(
                  icon,
                  height: 40,
                  //color: constFontColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
