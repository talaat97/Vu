import 'package:flutter/material.dart';
import 'package:vue_v4/services/theme_services.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            'assets/background.png',
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Some tips to use our app ',
                  style: body30tyle,
                ),
                Text(
                  '1. sending the capture photo of vital sign of the pathient to dodctor to help in reading and analysis it ',
                  style: body20Style,
                ),
                Text(
                  '2.the vital sign that is caputre u can see it in any time you want by open vital sign page in evey patient bed',
                  style: body20Style,
                ),
                Text(
                  '3.add any task to do it as nurse or see the previse tasks that is add to patient (drug as examle) as a doctor ',
                  style: body20Style,
                ),
                Text(
                  '4.handel a lot of beds in just one time just by open the app in hospital all by one click',
                  style: body20Style,
                ),
                Text(
                  '5.working now in new versin to handel notification servise by adding task or when the vital sign is unpnormal ',
                  style: body20Style,
                ),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
