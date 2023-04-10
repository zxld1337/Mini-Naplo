import 'package:flutter/material.dart';
import 'package:get/get.dart';
// controllers
import 'package:mini_naplo/services/controllers/api_service.dart';
import 'package:mini_naplo/services/controllers/chart_controller.dart';
// components
import 'package:mini_naplo/pages/grades/components/stats_tile.dart';
import 'package:mini_naplo/pages/page_frame.dart';
import 'components/grade_tile.dart';
//utils
import 'package:mini_naplo/constants/constants.dart';

class GradesPage extends StatelessWidget {
  GradesPage({super.key});

  final apiService = Get.find<ApiService>();
  final chartController = Get.find<ChartController>();

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      bgAsset: constBgRive,
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
                itemCount: apiService.gradesPerSubject.value.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  final currentSubject = apiService.gradesPerSubject.value.keys.elementAt(index);
                  final avgCalc = apiService.gradesPerSubject.value[currentSubject]["calculated"];
                  return GradeTile(
                    subject: currentSubject,
                    avg: avgCalc,
                    avgBgColor: gradeValueColor[avgCalc.round()]!,
                    bRadius: chartController.getPadding(index, apiService.gradesPerSubject),
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
