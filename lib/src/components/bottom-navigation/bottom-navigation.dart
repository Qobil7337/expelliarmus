import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.shifting,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Color.fromRGBO(135, 99, 99, 1.0),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset("lib/src/assets/icons/panel.svg"),
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
    );
  }
}
