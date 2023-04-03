// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:glass_ui/models/grade.dart';
import 'package:fl_chart/fl_chart.dart';

class PieData {
  final String value;
  final int amount;

  PieData(
    this.value,
    this.amount,
  );

  static List<PieData> getSections(List grades) {
    Map<String, int> amountByValue = {"5": 0, "4": 0, "3": 0, "2": 0, "1": 0};

    for (Grade grade in grades) {
      if (amountByValue.containsKey(grade.value)) {
        amountByValue[grade.value] = (amountByValue[grade.value] ?? 0) + 1;
      }
    }

    List<PieData> returnList = [];
    amountByValue.forEach((key, value) => returnList.add(PieData(key, value)));

    return returnList;
  }
}
