import 'package:flutter/material.dart';
import '../services/theme_services.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedPage;
  final ValueChanged<int> onPageChanged;

  const BottomNavBar({
    super.key,
    required this.selectedPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: ThemeManager.deepBlue,
      onTap: onPageChanged,
      currentIndex: selectedPage,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: 'Profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_circle_outline),
          label: 'Tasks',
        ),
      ],
    );
  }
}
