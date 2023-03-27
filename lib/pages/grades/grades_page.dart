import 'package:flutter/material.dart';
import 'package:get/get.dart';
// controllers
import 'package:glass_ui/controllers/api_controller.dart';
import 'package:glass_ui/controllers/chart_controller.dart';
// components
import 'package:glass_ui/pages/grades/components/stats_tile.dart';
import 'package:glass_ui/pages/page_frame.dart';
import 'components/grade_tile.dart';
//utils
import 'package:glass_ui/utils/const_varibles.dart';
import 'package:glass_ui/utils/color_dict.dart';

class GradesPage extends StatelessWidget {
  GradesPage({super.key});

  final apiController = Get.find<ApiController>();
  final chartController = Get.find<ChartController>();

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      bgAsset: "assets/student/shapes_purple.riv",
      bgImage: Container(),
      bottom: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // header
          const Text(
            "Értékelések",
            style: TextStyle(
              fontSize: 30,
              fontFamily: constFontFamily,
              height: 1.2,
              color: constFontColor,
            ),
          ),

          const SizedBox(height: 30),

          // Top chart
          Obx(
            () => StatsTile(
              palette: chartController.palette.value,
              valueData: chartController.valueData.value,
            ),
          ),

          const SizedBox(height: 10),

          // avg / subject listTile
          Obx(
            () => Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: apiController.gps.value.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final currentSubject = apiController.gps.value.keys.elementAt(index);
                  final avgCalc = apiController.gps.value[currentSubject]["calculated"];
                  return GradeTile(
                    subject: currentSubject,
                    avg: avgCalc,
                    avgBgColor: gradeValueColor[avgCalc.round()]!,
                    bRadius: chartController.getPadding(index, apiController.gps),
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
