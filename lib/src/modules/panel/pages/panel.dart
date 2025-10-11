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
  @override
  Widget build(BuildContext context) {
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
            child: LineGraph(data: expenses)
          ),
        )
      ],
    );
  }
}
