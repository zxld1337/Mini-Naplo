import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_naplo/constants/constants.dart';
import 'package:mini_naplo/controllers/api_service.dart';
import 'package:mini_naplo/view/pages/rive_page_frame.dart';
import 'package:mini_naplo/view/pages/timetable/components/no_lession_tile.dart';
import 'components/tile_list_builder.dart';

class TimetablePage extends GetView<ApiService> {
  const TimetablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageFrame(
      bgAsset: constBgRive,
      needBgImage: true,
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
              color: constTitleColor,
            ),
          ),
          // current day of the week
          Text(
            "Mai nap",
            style: TextStyle(
              fontSize: 18,
              fontFamily: constFontFamily,
              color: constTitleColor.withOpacity(0.4),
              height: 1.2,
            ),
          ),

          // margin between header and content
          const SizedBox(
            height: 30,
          ),

          // lession tile's or noLessionTile
          Obx(
            () => controller.timeTable().isEmpty
                ? const NoLessionTile(
                    text: "Nincsenek óráid",
                    bgColor: constSecondaryColor,
                  )
                : const TileListBuilder(),
          ),
        ],
      ),
    );
  }
}
