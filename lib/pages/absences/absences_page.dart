import 'package:flutter/material.dart';
import 'package:get/get.dart';
// models
import '../../services/controllers/api_service.dart';
import '../../services/models/absences.dart';
// components
import '../page_frame.dart';
import 'components/absences_tile.dart';
import 'components/square_tile.dart';
// utils
import 'package:mini_naplo/constants/constants.dart';

class AbsencesPage extends StatelessWidget {
  AbsencesPage({super.key});

  static const double _opacity = 0.6;
  final apiService = Get.find<ApiService>();

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      bgAsset: constBgRive,
      bgImage: Container(),
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Hiányzások",
            style: TextStyle(
              fontSize: 30,
              fontFamily: constFontFamily,
              height: 1.2,
              color: constFontColor,
            ),
          ),
          const SizedBox(height: 30),

          // Square Tiles
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SquareTile(
                  bgColor: const Color.fromARGB(255, 59, 225, 59).withOpacity(_opacity),
                  text1: "Igazolt",
                  text2: "hiányzások",
                  hours: "${apiService.absence.value.verifiedAbsences}",
                ),
                SquareTile(
                  bgColor: const Color.fromARGB(255, 255, 59, 59).withOpacity(_opacity),
                  text1: "Igazolandó",
                  text2: "hiányzások",
                  hours: "${apiService.absence.value.unVerifiedAbsences}",
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),
          Text(
            "Tantárgyanként",
            style: TextStyle(
              fontFamily: constFontFamily,
              color: constFontColor.withOpacity(0.6),
            ),
          ),
          const SizedBox(height: 8),
          // lession tile
          Obx(
            () => Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: apiService.absence.value.perSubject!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AbsencesTile(
                      name: apiService.absence.value.perSubject!.keys.elementAt(index),
                      hours: apiService.absence.value.perSubject!.values
                          .elementAt(index)
                          .toString(),
                      bgColor: constBgColor,
                      icon: subjectImg[Absences.nameConv[
                              apiService.absence.value.perSubject!.keys.elementAt(index)]] ??
                          constSubjectIcon,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
