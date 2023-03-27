import 'package:flutter/material.dart';
import 'package:get/get.dart';
// models
import '../../controllers/api_controller.dart';
import '../../models/absences.dart';
// components
import '../page_frame.dart';
import 'components/absences_tile.dart';
import 'components/square_tile.dart';
// utils
import '../../utils/image_dict.dart';
import '../../utils/const_varibles.dart';

class AbsencesPage extends StatelessWidget {
  AbsencesPage({super.key});

  static const double _opacity = 0.6;
  final apiController = Get.find<ApiController>();

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      bgAsset: "assets/student/shapes_purple.riv",
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
                  hours: "${apiController.absence.value.verifiedAbsences}",
                ),
                SquareTile(
                  bgColor: const Color.fromARGB(255, 255, 59, 59).withOpacity(_opacity),
                  text1: "Igazolandó",
                  text2: "hiányzások",
                  hours: "${apiController.absence.value.unVerifiedAbsences}",
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
                itemCount: apiController.absence.value.perSubject!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AbsencesTile(
                      name: apiController.absence.value.perSubject!.keys.elementAt(index),
                      hours: apiController.absence.value.perSubject!.values
                          .elementAt(index)
                          .toString(),
                      bgColor: constBgColor,
                      icon: subjectImg[Absences.nameConv[
                              apiController.absence.value.perSubject!.keys.elementAt(index)]] ??
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
