import 'package:flutter/material.dart';
import 'package:vue_v4/screens/patient_bed/pathient_bed.dart';
import 'package:vue_v4/screens/units&beds/add_patient.dart';
import 'package:vue_v4/services/theme_services.dart';
import '../../controller/video_cotroller.dart';

List<Patient> patients = [
  Patient('Ahmed', 25, 'soha', 'cancer'),
  Patient('Ali', 31, 'soha', 'heat attack'),
  Patient('talaat', 20, 'Mahmoud', 'broken'),
  Patient('ashref', 25, 'Mahmoud', 'cancer'),
  Patient('yaser', 48, 'soha', 'cancer'),
];

class BedsScreen extends StatelessWidget {
  const BedsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Beds:',
              style: headingStyle,
            ),
            Text(
              '3',
              style: headingStyle.copyWith(color: ThemeManager.gryVu),
            ),
            Text(
              '/5',
              style: headingStyle,
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: getUnitsData(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (context, index) {
              if (index > 2) {
                return notbedItem(context);
              } else {
                return bedItem(context, index);
              }
            },
            itemCount: snapshot.data?.length ?? 0,
          );
        },
      ),
    );
  }

  Future<List<Map<String, dynamic>>?> getUnitsData() async {
    return [
      {},
      {},
      {},
      {},
      {},
    ];
  }

  bedItem(context, index) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const PathientBed(),
          ),
        );
      },
      child: Container(
        height: 300,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ThemeManager.deepBlue,
          ),
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.grey)],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: const VideoPlayerWidget(videoPath: 'assets/beds2.mp4'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text('name :'),
                        Text(
                          patients[index].name,
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(
                          width: 30
                        ),
                        const Text(
                          'age :',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          '${patients[index].age}',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text(
                          'nurse :',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        
                        Text(
                          patients[index].Nuser,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        const Text(
                          'illness :',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          patients[index].illness,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue.shade800,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  notbedItem(context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const AddPatient(),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: ThemeManager.deepBlue,
          ),
          color: Colors.white.withOpacity(0.8),
          boxShadow: const [BoxShadow(color: Colors.grey)],
        ),
        child: Column(
          children: [
            Image.asset(
              width: 200,
              height: 200,
              'assets/no_patient.png',
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'No patient added yet ',
                    style: headingStyle.copyWith(color: ThemeManager.gryVu),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Text(
                      'Click to add paitent ',
                      style:
                          subtitleStyle.copyWith(color: ThemeManager.deepBlue),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Patient {
  String name;
  int age;
  String Nuser;
  String illness;

  Patient(
    this.name,
    this.age,
    this.Nuser,
    this.illness,
  );
}
