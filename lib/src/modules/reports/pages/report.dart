import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../components/bar chart/bar-chart.dart';
import '../../../components/line graph/line-graph.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  int selectedIndex = 1;
  final items = ['Haftalik', 'Oylik', 'Yillik'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Toggle
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6.0),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(241, 242, 245, 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ToggleSwitch(
                    cornerRadius: 10.0,
                    radiusStyle: true,
                    initialLabelIndex: selectedIndex,
                    totalSwitches: 3,
                    labels: items,
                    minWidth: 120,
                    minHeight: 30,
                    borderColor: [Colors.transparent],
                    inactiveBgColor: const Color.fromRGBO(241, 242, 245, 1),
                    inactiveFgColor: Colors.grey[700],
                    activeBgColors: const [
                      [Colors.white],
                      [Colors.white],
                      [Colors.white],
                    ],
                    activeFgColor: Colors.black,
                    onToggle: (index) {
                      setState(() {
                        selectedIndex = index!;
                      });
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            // Title
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text("Kategoriyalar bo'yicha xarajatlar"),
            ),

            // Total amount
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "1,250,000 so'm",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Change percentage (wraps naturally)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Bu oy ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TextSpan(
                      text: "+15%",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                softWrap: true,
              ),
            ),

            const SizedBox(height: 8),

            // Bar chart
            ExpenseBarChart(expenses: {
              'Food': 150,
              'Transport': 100,
              'Bills': 50,
              'Entertainment': 80,
              'Foodd': 150,
              'Transportt': 100,
              'Billss': 50,
              'Entertainmentt': 80,
            }),

            const SizedBox(height: 12),

            // Last 6 months header (will wrap if needed)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "So'ngi 6 oy ",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    TextSpan(
                      text: "+15%",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                softWrap: true,
              ),
            ),

            const SizedBox(height: 8),

            // Line graph card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: 260,
              child: LineGraph(
                data: {
                  1: 1250000,
                  2: 1380000,
                  3: 1220000,
                  4: 1490000,
                  5: 1580000,
                  6: 1620000,
                },
                graphMode: 'monthly',
              ),
            ),

            // Add some bottom spacing so last element isn't glued to screen edge
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
