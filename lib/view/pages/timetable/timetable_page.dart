import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/controllers/api_service.dart';
import 'components/lession_tile.dart';
import 'package:mini_naplo/view/pages/static_page_frame.dart';
import 'package:mini_naplo/constants/constants.dart';


class TimetablePage extends GetView<ApiService> {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      //bgAsset: timetableBgRive,
      //needBgImage: false,
      bottom: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          // Page name
          const Text(
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
          const SizedBox(
            height: 30,
          ),

          // lession tile
          Expanded(
            child: Obx(
              () => ListView.builder(
                physics: const BouncingScrollPhysics(),
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
