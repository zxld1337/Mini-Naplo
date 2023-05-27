import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:mini_naplo/controllers/api_service.dart';
import 'package:mini_naplo/constants/constants.dart';
import 'lession_tile.dart';

class TileListBuilder extends GetView<ApiService> {
  const TileListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
    );
  }
}
