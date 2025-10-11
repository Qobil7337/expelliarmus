import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Panel extends StatefulWidget {
  const Panel({super.key});

  @override
  State<Panel> createState() => _PanelState();
}

class _PanelState extends State<Panel> {
  final expenses = {
    1: 100000,
    3: 250000,
    5: 120000,
    8: 400000,
    12: 150000,
    16: 320000,
    20: 450000,
    25: 220000,
    28: 380000,
  };
  @override
  Widget build(BuildContext context) {
    final sortedDays = expenses.keys.toList()..sort();
    final spots = sortedDays.map((day) {
      return FlSpot(day.toDouble(), expenses[day]!.toDouble());
    }).toList();

    final maxY = expenses.values.reduce((a, b) => a > b ? a : b);

    print('this spots');
    print(spots);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            'Bu oy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 240, 240,1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Umumiy xarajat', style: TextStyle(fontSize: 16)),
                SizedBox(height: 4),
                Text(
                  "1,250,000 so'm",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 0, 0),
          child: Text(
            'This Month',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 240, 240,1),
              borderRadius: BorderRadius.circular(12),
            ),
            height: 260,
            child: LineChart(
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
            ),
          ),
        )
      ],
    );
  }
}
