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
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(14.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(4),
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text("Kategoriyalar bo'yicha xarajatlar"),
            alignment: Alignment.centerLeft,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Text(
              "1,250,000 so'm",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.centerLeft,
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Bu oy ",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                  TextSpan(
                    text: "+15%",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green, // color for "+15%"
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
