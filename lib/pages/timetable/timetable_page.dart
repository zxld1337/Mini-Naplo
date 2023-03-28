// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_ui/controllers/api_controller.dart';
// components
import 'components/lession_tile.dart';
import '../page_frame.dart';
// utils
import 'package:glass_ui/utils/constants.dart';

class TimetablePage extends StatelessWidget {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget bgImage = Positioned(
      width: MediaQuery.of(context).size.width * 1.7,
      bottom: 200,
      left: 100,
      child: Image.asset("assets/Backgrounds/Spline.png"),
    );

    return PageFrame(
      bgAsset: "assets/RiveAssets/shapes.riv",
      bgImage: bgImage,
      bottom: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          // Page name
          Text(
            "Órarend",
            style: TextStyle(
              fontSize: 30,
              fontFamily: constFontFamily,
              height: 1.2,
              color: constFontColor,
            ),
          ),
          // current day of the week
          Text(
            "Mai nap",
            style: TextStyle(
              fontSize: 18,
              fontFamily: constFontFamily,
              color: constFontColor.withOpacity(0.4),
              height: 1.2,
            ),
          ),

          // margin between header and content
          SizedBox(
            height: 30,
          ),

          // lession tile
          Expanded(
            child: GetX<ApiController>(
              builder: (controller) => ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: controller.timeTable.length,
                itemBuilder: (context, index) {
                  final ctt = controller.timeTable;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: LessionTile(
                      name: ctt[index].name,
                      subNumber: ctt[index].subjectNum,
                      teacher: ctt[index].teacher,
                      roomId: ctt[index].roomId,
                      fromTime: ctt[index].fromTime,
                      tillTime: ctt[index].tillTime,
                      bgColor: subjectColor[ctt[index].name] ?? constBgColor,
                      icon: subjectImg[ctt[index].name] ?? constSubjectIcon,
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
