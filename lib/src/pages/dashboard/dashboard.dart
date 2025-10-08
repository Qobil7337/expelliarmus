import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../modules/expense/pages/create-expense/create-expense.dart';
import '../../modules/panel/pages/panel.dart';
import '../../modules/profile/pages/profile.dart';
import '../../modules/reports/pages/report.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    Panel(),
    CreateExpense(),
    Report(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _pages[_selectedIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Color.fromRGBO(135, 99, 99, 1.0),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/src/assets/icons/dashboard.svg"),
            label: 'Panel',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/src/assets/icons/add.svg"),
            label: "Xarajat+",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/src/assets/icons/report.svg"),
            label: 'Xisobotlar',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("lib/src/assets/icons/profile.svg"),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class Reports {
  const Reports();
}
