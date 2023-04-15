import 'package:get/get.dart';
import 'package:mini_naplo/services/models/grade.dart';
import 'package:mini_naplo/pages/grades/models/value_count.dart';
import 'package:flutter/material.dart';
import 'package:mini_naplo/constants/constants.dart';

class ChartController extends GetxController {
  final _valueData = <ValueCount>[].obs;
  final _palette = <Color>[].obs;
  final grades = <Grade>[].obs;

  get getPalette => _palette.value;
  get getValueData => _valueData.value;

  setData(data) {
    grades.value = data;
    grades.retainWhere((sub) => sub.value.length == 1);
    _valueData.value = ValueCount.getValueCount(grades);
    _palette.value = gradeValueColor.values.toList();
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
