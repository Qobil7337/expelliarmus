import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseBarChart extends StatelessWidget {
  final Map<String, double> expenses; // category -> amount

  const ExpenseBarChart({super.key, required this.expenses});

  @override
  Widget build(BuildContext context) {
    double maxExpense = expenses.values.isNotEmpty
        ? expenses.values.reduce((a, b) => a > b ? a : b)
        : 0;

    // Approximate width per bar group
    const double baseBarSpacing = 40.0; // space between bars
    final List<String> keys = expenses.keys.toList();

    // Calculate total width needed
    double totalWidth = 0;
    for (final key in keys) {
      totalWidth += key.length * 6.0 + baseBarSpacing;
    }

    return Container(
      height: 300,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: totalWidth < MediaQuery.of(context).size.width
              ? MediaQuery.of(context).size.width
              : totalWidth,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: maxExpense * 1.2,
              barTouchData: BarTouchData(enabled: true),
              gridData: FlGridData(show: false),
              titlesData: FlTitlesData(
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      int index = value.toInt();
                      if (index < 0 || index >= expenses.length) {
                        return const SizedBox();
                      }
                      String category = keys[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          category,
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    },
                    reservedSize: 40,
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              barGroups: keys.map((key) {
                int index = keys.indexOf(key);
                double width = key.length * 6.0;
                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      toY: expenses[key] ?? 0,
                      color: Colors.blue,
                      width: width,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
