import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseBarChart extends StatelessWidget {
  final Map<String, double> expenses; // category -> amount

  const ExpenseBarChart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    // Find max expense to scale bars
    double maxExpense = expenses.values.isNotEmpty
        ? expenses.values.reduce((a, b) => a > b ? a : b)
        : 0;
    return Container(
      height: 300,
      padding: EdgeInsets.all(16),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxExpense * 1.2,
          // add some top margin
          barTouchData: BarTouchData(enabled: true),
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  int index = value.toInt();
                  if (index < 0 || index >= expenses.length) return Container();
                  String category = expenses.keys.elementAt(index);
                  return Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Text(category, style: TextStyle(fontSize: 12)),
                  );
                },
                reservedSize: 40,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          barGroups: expenses.entries.map((entry) {
            int index = expenses.keys.toList().indexOf(entry.key);
            return BarChartGroupData(
              x: index,
              barRods: [
                BarChartRodData(
                  toY: entry.value,
                  color: Colors.blue,
                  width: 20,
                  borderRadius: BorderRadius.circular(4),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
