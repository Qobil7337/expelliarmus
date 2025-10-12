import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

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
    return Center(
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Color.fromRGBO(241, 242, 245, 1),
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
          inactiveBgColor: Color.fromRGBO(241, 242, 245, 1),
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
    );
  }
}
