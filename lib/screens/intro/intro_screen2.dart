import 'package:flutter/material.dart';

import '../../services/theme_services.dart';

class IntroPage2 extends StatefulWidget {
  const IntroPage2({super.key});

  @override
  State<IntroPage2> createState() => _IntroPage2State();
}

class _IntroPage2State extends State<IntroPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         backgroundColor:ThemeManager.deepBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              height: 500,
              child: Image.asset(
                'assets/Doctors2.png',
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
            child:  Column(
              children: [
                Text(
                  'VU',
                  style: TextStyle(
                      color:ThemeManager.deepBlue,
                      fontSize: 55,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    'round-the-clock monitoring of vital signs screens. ',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color:ThemeManager.deepBlue,
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
