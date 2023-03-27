// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_ui/controllers/api_controller.dart';
import 'package:glass_ui/routes/app_routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
// component
import 'components/info_tile.dart';
import '../page_frame.dart';
import '../../utils/const_varibles.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({super.key});

  void _logoutStudent(BuildContext context) {
    final mainBox = Hive.box('MainBox');
    mainBox.clear();
    Get.toNamed("${Routes.LOGIN}?relogin=true");
  }

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      bgAsset: "assets/student/shapes_purple.riv",
      bgImage: Container(),
      bottom: false,
      child: GetX<ApiController>(
        builder: (controller) {
          return Column(
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
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: constFontFamily,
                          height: 1.2,
                          color: constFontColor,
                        ),
                      ),
                      Text(
                        "Profil",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: constFontFamily,
                          height: 1,
                          color: constFontColor.withOpacity(0.4),
                        ),
                      ),
                    ],
                  ),
      
                  // Logout Button
                  InkWell(
                    onTap: () => _logoutStudent(context),
                    splashColor: Colors.redAccent,
                    child: Container(
                      height: 54,
                      width: 54,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.logout),
                    ),
                  )
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      InfoTile(
                        hintText: "Intézmény",
                        data: "${controller.student.value.instName}",
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Személyes adatok",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: constFontFamily,
                          height: 1,
                          color: constFontColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      InfoTile(
                        hintText: "Név",
                        data: "${controller.student.value.studentName}",
                      ),
                      InfoTile(
                        hintText: "Születési idő",
                        data: "${controller.student.value.birthYear}. ${controller.student.value.birthMonth}. ${controller.student.value.birthDay}.",
                      ),
                      InfoTile(
                        hintText: "Anyja neve",
                        data: "${controller.student.value.motherName}",
                      ),
                      InfoTile(
                        hintText: "Lakcím",
                        data: "${controller.student.value.address![0]}",
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Gondviselő",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: constFontFamily,
                          height: 1,
                          color: constFontColor,
                        ),
                      ),
                      SizedBox(height: 10),
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
          );
        }
      ),
    );
  }
}
