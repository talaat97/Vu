import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:vue_v4/models/uid.dart';
import 'package:vue_v4/screens/auth/choose_role.dart';
import 'package:vue_v4/screens/intro/intro_screen1.dart';
import 'package:vue_v4/screens/intro/intro_screen2.dart';

import '../intro/intro_screen3.dart';

class IntroSCreen extends StatefulWidget {
  const IntroSCreen({super.key});

  @override
  State<IntroSCreen> createState() => _IntroSCreenState();
}

class _IntroSCreenState extends State<IntroSCreen> {
  final PageController _controller = PageController();
  bool onlastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (value) {
              setState(() {
                onlastPage = (value == 2);
              });
            },
            controller: _controller,
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Positioned(
            left: 170,
            bottom: 170,
            child: SmoothPageIndicator(controller: _controller, count: 3),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 90),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 60,
                width: 400,
                child: CustomButton(
                    text: onlastPage ? 'done' : 'next',
                    onPressed: onlastPage
                        ? () => Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => const ChooseRole(),
                              ),
                            )
                        : () {
                            _controller.nextPage(
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeIn);
                          }),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  _controller.jumpToPage(2);
                },
                child: Text(
                  onlastPage ? '' : 'skip',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(1, 92, 146, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
