import 'package:expense_tracker/src/components/line%20graph/line-graph.dart';
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

  final int budget = 5000000;
  int get totalExpenses => expenses.values.fold(0, (a, b) => a + b);

  @override
  Widget build(BuildContext context) {
    final double progress = (totalExpenses / budget).clamp(0.0, 1.0);
    final String remaining = "2,500,000";
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
            'Bu oy',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            height: 260,
            child: LineGraph(data: expenses)
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Byudjet 5,000,000 so'm",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Byudjet qoldig'i",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "$remaining",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: LinearProgressIndicator(
                  value: progress,
                  minHeight: 10,
                  backgroundColor: Colors.grey[300],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.redAccent),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${(progress * 100).toStringAsFixed(1)}% sarflandi',
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          )
        ),
      ],
    );
  }
}
