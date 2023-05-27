import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/controllers/api_service.dart';
import 'package:mini_naplo/controllers/navigator_controller.dart';
import 'components/info_tile.dart';
import 'package:mini_naplo/constants/constants.dart';
import 'package:mini_naplo/view/pages/rive_page_frame.dart';


class StudentPage extends GetView<ApiService> {
  const StudentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      bgAsset: constBgRive,
      needBgImage: false,
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${controller.student.value.studentName}",
                      style: const TextStyle(
                        fontSize: 30,
                        fontFamily: constFontFamily,
                        height: 1.2,
                        color: constTitleColor,
                      ),
                    ),
                    Text(
                      "Profil",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: constFontFamily,
                        height: 1,
                        color: constTitleColor.withOpacity(0.4),
                      ),
                    ),
                  ],
                ),

                // Logout Button
                InkWell(
                  onTap: NavigatorController.to.logoutStudent,
                  splashColor: Colors.redAccent,
                  child: Container(
                    height: 54,
                    width: 54,
                    decoration: BoxDecoration(
                      color: Colors.redAccent.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.logout),
                  ),
                )
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    InfoTile(
                      hintText: "Intézmény",
                      data: "${controller.student.value.instName}",
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Személyes adatok",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: constFontFamily,
                        height: 1,
                        color: constFontColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InfoTile(
                      hintText: "Név",
                      data: "${controller.student.value.studentName}",
                    ),
                    InfoTile(
                      hintText: "Születési idő",
                      data:
                          "${controller.student.value.birthYear}. ${controller.student.value.birthMonth}. ${controller.student.value.birthDay}.",
                    ),
                    InfoTile(
                      hintText: "Anyja neve",
                      data: "${controller.student.value.motherName}",
                    ),
                    InfoTile(
                      hintText: "Lakcím",
                      data: "${controller.student.value.address![0]}",
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Gondviselő",
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: constFontFamily,
                        height: 1,
                        color: constFontColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    InfoTile(
                      hintText: "Neve",
                      data: "${controller.student.value.parents![0]['Nev']}",
                    ),
                    InfoTile(
                      hintText: "E-mail",
                      data: "${controller.student.value.parents![0]['EmailCim']}",
                    ),
                    InfoTile(
                      hintText: "Telefonszám",
                      data: "${controller.student.value.parents![0]['Telefonszam']}",
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
