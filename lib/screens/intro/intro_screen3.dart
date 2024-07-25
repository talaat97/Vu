import 'package:flutter/material.dart';

import '../../services/theme_services.dart';

class IntroPage3 extends StatefulWidget {
  const IntroPage3({super.key});

  @override
  State<IntroPage3> createState() => _IntroPage3State();
}

class _IntroPage3State extends State<IntroPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.deepBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              height: 500,
              child: Image.asset(
                'assets/Doctors3.png',
                fit: BoxFit.cover,
              )),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
              color: Colors.white,
            ),
            height: MediaQuery.of(context).size.height / 2.6,
            child: Column(
              children: [
                Text(
                  'VU',
                  style: TextStyle(
                      color: ThemeManager.deepBlue,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    'All medical history for ICU patients are now between your hand. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: ThemeManager.deepBlue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
