import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:glass_ui/pages/grades/models/value_count.dart';
import 'package:glass_ui/utils/constants.dart';

class StatsTile extends StatelessWidget {
  final List<ValueCount> valueData;
  final List<Color> palette;
  
  const StatsTile({
    super.key,
    required this.valueData,
    required this.palette,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      decoration: BoxDecoration(
        color: constBgColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: SfCircularChart(
        series: <CircularSeries>[
          DoughnutSeries<ValueCount, String>(
            dataSource: valueData,
            xValueMapper: (ValueCount data, _) => data.value,
            yValueMapper: (ValueCount data, _) => data.amount,
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              textStyle: TextStyle(
                fontSize: 20,
                fontFamily: constFontFamily,
                color: constFontColor.withOpacity(0.7),
              ),
            ),
          )
        ],
        legend: Legend(
          isVisible: true,
          overflowMode: LegendItemOverflowMode.wrap,
          textStyle: TextStyle(
            fontSize: 16,
            fontFamily: constFontFamily,
            color: constFontColor.withOpacity(0.7),
          ),
        ),
        palette: palette,
      ),
    );
  }
}
