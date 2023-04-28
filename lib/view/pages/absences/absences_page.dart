import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/controllers/api_service.dart';
import 'package:mini_naplo/models/absences.dart';
import 'package:mini_naplo/view/pages/static_page_frame.dart';
import 'components/absences_tile.dart';
import 'components/square_tile.dart';
import 'package:mini_naplo/constants/constants.dart';


class AbsencesPage extends GetView<ApiService> {
  const AbsencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      //bgAsset: constBgRive,
      //needBgImage: false,
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
                  bgColor: const Color.fromARGB(255, 59, 225, 59).withOpacity(constOpacity),
                  text1: "Igazolt",
                  text2: "hiányzások",
                  hours: "${controller.absence().verifiedAbsences}",
                ),
                SquareTile(
                  bgColor: const Color.fromARGB(255, 255, 59, 59).withOpacity(constOpacity),
                  text1: "Igazolandó",
                  text2: "hiányzások",
                  hours: "${controller.absence().unVerifiedAbsences}",
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
                itemCount: controller.absence().perSubject!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: AbsencesTile(
                      name: controller.absence().perSubject!.keys.elementAt(index),
                      hours: controller.absence().perSubject!.values.elementAt(index).toString(),
                      bgColor: constBgColor,
                      icon: subjectImg[Absences
                              .nameConv[controller.absence().perSubject!.keys.elementAt(index)]] ??
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
