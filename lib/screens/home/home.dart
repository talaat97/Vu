import 'package:flutter/material.dart';
import 'package:vue_v4/screens/home/profile.dart';
import 'package:vue_v4/screens/home/tasks_page.dart';
import 'package:vue_v4/screens/units&beds/units.dart';
import '../../widgets/bottom_nav_bar.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedPage = 1;

  List<Widget> pages = const [
    Profile(),
    UnitsSceen(),
    TaskPage(),
  ];

  void onPageChanged(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(       
      body: pages[selectedPage],
      bottomNavigationBar: BottomNavBar(
        selectedPage: selectedPage,
        onPageChanged: onPageChanged,
      ),
    );
  }
}
