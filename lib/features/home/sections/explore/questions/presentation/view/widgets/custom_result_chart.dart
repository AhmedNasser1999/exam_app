import 'package:exam_app/core/theme/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CustomResultChart extends StatelessWidget {
  const CustomResultChart({super.key, required this.number});
  final double number;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              startDegreeOffset: 270,
              sectionsSpace: 10,
              centerSpaceRadius: MediaQuery.of(context).size.height * 0.08,
              sections: [
                PieChartSectionData(
                  color: AppColors.blue,
                  value: number,
                  radius: 7,
                  showTitle: false,
                ),
                PieChartSectionData(
                  color: AppColors.red,
                  value: 100 - number,
                  radius: 7,
                  showTitle: false,
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$number%",
                style: theme.textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
