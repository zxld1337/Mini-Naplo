import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:mini_naplo/controllers/api_service.dart';
import 'package:mini_naplo/view/pages/home/components/eval_tile.dart';
import 'package:mini_naplo/constants/constants.dart';
import 'package:mini_naplo/view/pages/static_page_frame.dart';


class HomePage extends GetView<ApiService> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // header
          const Text(
            "Főoldal",
            style: TextStyle(
              fontSize: 30,
              fontFamily: constFontFamily,
              height: 1.2,
              color: constTitleColor,
            ),
          ),
          Text(
            "Legfrissebb jegyek",
            style: TextStyle(
              fontSize: 16,
              color: constTitleColor.withOpacity(0.4),
              fontWeight: FontWeight.bold,
              fontFamily: constFontFamily,
            ),
          ),

          const SizedBox(height: 10),

          Expanded(
            child: LiquidPullToRefresh(
              backgroundColor: constSecondaryColor,
              color: Colors.transparent,
              height: 100,
              borderWidth: 2,
              animSpeedFactor: 8,
              showChildOpacityTransition: false,
              onRefresh: ApiService.to.refreshData,
              child: Obx(
                () => ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: controller.grades.length,
                  itemBuilder: (BuildContext context, int index) {
                    String topic = controller.grades[index].topic != null
                        ? controller.grades[index].topic!
                        : controller.grades[index].gradeType ?? "Félévi";

                    topic = topic.length < 30 ? topic : topic.substring(0, 30);
                    return EvalTile(
                      value: controller.grades[index].value,
                      topic: topic,
                      evalName: controller.grades[index].evalName,
                      date: controller.grades[index].fixedDate,
                      color: gradeValueColor[int.tryParse(controller.grades[index].value)] ??
                          Colors.white,
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
