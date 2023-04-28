import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/controllers/api_service.dart';
import 'package:mini_naplo/controllers/chart_controller.dart';
import 'package:mini_naplo/view/pages/grades/components/stats_tile.dart';
import 'package:mini_naplo/view/pages/static_page_frame.dart';
import 'components/grade_tile.dart';
import 'package:mini_naplo/constants/constants.dart';


class GradesPage extends GetView<ChartController> {
  const GradesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
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
              color: constTitleColor,
            ),
          ),

          const SizedBox(height: 30),

          // Top chart
          Obx(
            () => StatsTile(
              palette: controller.getPalette,
              valueData: controller.getValueData,
            ),
          ),

          const SizedBox(height: 10),

          // avg / subject listTile
          Obx(
            () => Expanded(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: ApiService.to.gradesPerSubject().length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final currentSubject = ApiService.to.gradesPerSubject().keys.elementAt(index);
                  final avgCalc = ApiService.to.gradesPerSubject()[currentSubject]["calculated"];
                  return GradeTile(
                    subject: currentSubject,
                    avg: avgCalc,
                    avgBgColor: gradeValueColor[avgCalc.round()]!,
                    bRadius: controller.getPadding(index, ApiService.to.gradesPerSubject),
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
