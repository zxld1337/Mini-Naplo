import 'package:get/get.dart';
import 'package:glass_ui/services/models/grade.dart';
import 'package:glass_ui/pages/grades/models/value_count.dart';
import 'package:flutter/material.dart';
import 'package:glass_ui/constants/constants.dart';

class ChartController extends GetxController {
  final valueData = <ValueCount>[].obs;
  final palette = <Color>[].obs;
  final grades = <Grade>[].obs;

  setData(data) {
    grades.value = data;
    grades.retainWhere((sub) => sub.value.length == 1);
    valueData.value = ValueCount.getValueCount(grades);
    palette.value = gradeValueColor.values.toList();
  }

  // Returns padding if first or last item in map
  BorderRadius getPadding(int index, gps) {
    if (index == 0) {
      return const BorderRadius.only(
        topRight: Radius.circular(16.0),
        topLeft: Radius.circular(16.0),
      );
    } else if (index == gps.length - 1) {
      return const BorderRadius.only(
        bottomLeft: Radius.circular(16.0),
        bottomRight: Radius.circular(16.0),
      );
    }
    return BorderRadius.circular(0);
  }
}
