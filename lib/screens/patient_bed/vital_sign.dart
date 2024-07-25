import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';

import '../../services/theme_services.dart';

class VitalSign extends StatefulWidget {
  const VitalSign({super.key});

  @override
  State<VitalSign> createState() => _VitalSignState();
}

DateTime selectDate = DateTime.now();
int x = 1;

class _VitalSignState extends State<VitalSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Vital Sign',
          style: headingStyle,
        ),
      ),
      body: Column(
        children: [
          _showDate(),
          _showVitalsign(),
        ],
      ),
    );
  }

  _showDate() {
    return DatePicker(
      DateTime.now(),
      width: 60,
      height: 100,
      dateTextStyle: titleStyle.copyWith(fontSize: 20, color: Colors.grey),
      dayTextStyle: titleStyle.copyWith(fontSize: 16, color: Colors.grey),
      monthTextStyle: titleStyle.copyWith(fontSize: 12, color: Colors.grey),
      initialSelectedDate: DateTime.now(),
      selectionColor: ThemeManager.deepBlue,
      onDateChange: (date) {
        setState(() {
          selectDate = date;
        });
      },
    );
  }

  _showVitalsign() {
    return Expanded(
        child: ListView(
      children: [
        vitalsignrecourd('heart'),
        vitalsignrecourd('beat'),
        vitalsignrecourd('pressure'),
        vitalsignrecourd('oxygen'),
        vitalsignrecourd('diabetes'),
      ],
    ));
  }

  Widget vitalsignrecourd(String spesificVitalSign) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.5),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              width: 70,
              height: 100,
              decoration: BoxDecoration(
                color: ThemeManager.deepBlue,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  spesificVitalSign,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
           const SizedBox(
              width: 5,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 24,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  List<int> dummylist = [
                    60,
                    45,
                    65,
                    274,
                    84,
                    482,
                    24,
                    74,
                    54,
                    81,
                    24,
                    3,
                    56,
                    84,
                    15,
                    45,
                    98,
                    23,
                    12,
                    45,
                    74,
                    12,
                    54,
                    60
                  ];
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    child: vitalSignin24hour(
                      index + 1,
                      dummylist[index],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );

    
  }

  Widget vitalSignin24hour(int hour, int numVital) {
    return Container(
      width: 50,
      height: 100,
      decoration: BoxDecoration(
          color: ThemeManager.litteBlue,
          borderRadius: BorderRadius.circular(5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${convertToTime(hour)} ',
            style: const TextStyle(color: Colors.white),
          ),
          const Divider(
            color: Colors.white,
          ),
          Text(
            '$numVital',
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

String convertToTime(int number) {
  if (number < 1 || number > 24) {
    throw ArgumentError('Number must be between 1 and 24');
  }

  // Convert number to time format
  if (number <= 12) {
    return '$number AM';
  } else {
    return '${number - 12} PM';
  }
}
