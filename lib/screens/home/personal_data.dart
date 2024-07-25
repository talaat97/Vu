import 'package:flutter/material.dart';

import '../../services/theme_services.dart';

class PersonalData extends StatelessWidget {
  const PersonalData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Patient Report',
          style: headingStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            showField('Name', 'ahmed ali'),
            showField('ID', 30008031900528),
            showField('Age', 24),
            showField('Gender', 'Male'),
            showField('hiegt', 170),
            showField('Wieght', 80),
            showField('Companion Phone', 01113809492),
            const SizedBox(
              height: 42,
            ),
            const InkWell(
              child: Text(
                'more details',
                style: TextStyle(
                  color: Color(0xfff6C6B6B),
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget showField(String fieldName, dynamic text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(fieldName,
              style: titleStyle.copyWith(color: ThemeManager.deepBlue)),
        ),
        Container(
          margin: const EdgeInsets.all(5),
          height: 55,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: const Color(0xfffdadada),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(text.toString(),
                  style: titleStyle.copyWith(color: Colors.black)),
            ),
          ),
        ),
      ],
    );
  }
}
