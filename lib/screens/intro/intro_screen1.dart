import 'package:flutter/material.dart';
import 'package:vue_v4/services/theme_services.dart';

class IntroPage1 extends StatefulWidget {
  const IntroPage1({super.key});

  @override
  State<IntroPage1> createState() => _IntroPage1State();
}

class _IntroPage1State extends State<IntroPage1> {
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
              'assets/Doctors1.png',
              fit: BoxFit.cover,
            ),
          ),
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
                  padding:const EdgeInsets.only(left: 5, right: 5),
                  child: Text(
                    'Group of doctor and nurse for quick and easy connect in ICU. ',
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
