import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glass_ui/services/api_service.dart';
import 'package:glass_ui/pages/home/components/eval_tile.dart';
import 'package:glass_ui/utils/constants.dart';
import '../page_frame.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      bgAsset: "assets/student/shapes_purple.riv",
      bgImage: Container(),
      bottom: false,
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
              color: constFontColor,
            ),
          ),          
          Text(
            "Legfrissebb jegyek",
            style: TextStyle(
              fontSize: 16,
              color: constFontColor.withOpacity(0.4),
              fontWeight: FontWeight.bold,
              fontFamily: constFontFamily,
            ),
          ),

          const SizedBox(height: 10),
          Expanded(
            child: GetX<ApiController>(
              builder: (controller) {
                return ListView.builder(
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
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
