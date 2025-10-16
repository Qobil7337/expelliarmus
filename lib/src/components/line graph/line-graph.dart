import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineGraph extends StatelessWidget {
  final Map<int, int> data;
  final String graphMode; // 'daily' or 'monthly'

  const LineGraph({super.key, required this.data, this.graphMode = 'daily'});

  @override
  Widget build(BuildContext context) {
    final spots = data.entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.toDouble());
    }).toList();

    final maxY = data.values.reduce((a, b) => a > b ? a : b);

    // Define graph ranges and intervals depending on mode
    double minX = 1;
    double maxX = graphMode == 'monthly' ? 6 : 31;
    double intervalX = graphMode == 'monthly' ? 1 : 7;

    return LineChart(
      LineChartData(
        minX: minX,
        maxX: maxX,
        minY: 0,
        maxY: maxY * 1.2,

        gridData: FlGridData(show: true, drawVerticalLine: false),
        titlesData: FlTitlesData(
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 22,
              interval: intervalX,
              getTitlesWidget: (value, meta) {
                if (graphMode == 'monthly') {
                  // Label months instead of days
                  final months = ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'];
                  int index = value.toInt() - 1;
                  if (index >= 0 && index < months.length) {
                    return Text(months[index],
                        style: const TextStyle(fontSize: 10));
                  }
                  return const SizedBox();
                } else {
                  // Show days
                  return Text(value.toInt().toString(),
                      style: const TextStyle(fontSize: 10));
                }
              },
            ),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: maxY / 4,
              getTitlesWidget: (value, meta) {
                return Text(
                  '${(value / 1000).toStringAsFixed(0)}k',
                  style: const TextStyle(fontSize: 10),
                );
              },
            ),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            barWidth: 2,
            dotData: FlDotData(show: false),
          ),
        ],
        lineTouchData: LineTouchData(
          enabled: true,
          touchTooltipData: LineTouchTooltipData(
            getTooltipItems: (touchedSpots) {
              final months = ['May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct'];

              return touchedSpots.map((spot) {
                if (graphMode == 'monthly') {
                  int index = spot.x.toInt() - 1;
                  String monthLabel =
                  (index >= 0 && index < months.length) ? months[index] : 'Noma’lum oy';
                  return LineTooltipItem(
                    'Oy $monthLabel\n${spot.y.toStringAsFixed(0)} so\'m',
                    const TextStyle(color: Colors.white),
                  );
                } else {
                  return LineTooltipItem(
                    'Kun ${spot.x.toInt()}\n${spot.y.toStringAsFixed(0)} so\'m',
                    const TextStyle(color: Colors.white),
                  );
                }
              }).toList();
            },
          ),
        ),
      ),
    );
  }
}
