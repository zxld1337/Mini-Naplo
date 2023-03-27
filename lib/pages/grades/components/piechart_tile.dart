import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:get/get.dart';


import '../../../controllers/chart_controller.dart';
import '../../../utils/const_varibles.dart';
import '../models/piechart_selections.dart';

class PieChartTile extends StatelessWidget {
  PieChartTile({super.key});
  
  final chartController = Get.find<ChartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
        color: constBgColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: PieChart(
        PieChartData(
          //sections: PieData.getSections(chartController.valueData),
        )
      ),
    );
  }
}
