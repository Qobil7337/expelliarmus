import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineGraph extends StatelessWidget {
  final Map<int, int> data;

  const LineGraph({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final spots = data.entries.map((e) {
      return FlSpot(e.key.toDouble(), e.value.toDouble());
    }).toList();

    final maxY = data.values.reduce((a, b) => a > b ? a : b);

    return LineChart(
        LineChartData(
            minX: 1,
            maxX: 31,
            minY: 0,
            maxY: maxY * 1.2,

            gridData: FlGridData(
                show: true,
                drawVerticalLine: false
            ),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 22,
                      interval: 7,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          value.toInt().toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      }
                  )
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
              topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(show: false),
            lineBarsData: [
              LineChartBarData(
                spots: spots,
                isCurved: true,
                barWidth: 2,
                dotData: FlDotData(show: false),
              )
            ],
            lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((spot) {
                      return LineTooltipItem(
                        'Kun ${spot.x.toInt()}\n${spot.y.toStringAsFixed(0)} so\'m',
                        const TextStyle(color: Colors.white),
                      );
                    }).toList();
                  },
                )
            )
        )
    );
  }
}
