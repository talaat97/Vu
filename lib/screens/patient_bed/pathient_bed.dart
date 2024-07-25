import 'package:flutter/material.dart';
import 'package:vue_v4/screens/home/personal_data.dart';
import 'package:vue_v4/screens/patient_bed/pathient_report.dart';
import 'package:vue_v4/screens/home/tasks_page.dart';
import 'package:vue_v4/screens/patient_bed/vital_sign.dart';
import 'package:vue_v4/services/theme_services.dart';

import '../../controller/video_cotroller.dart';

class PathientBed extends StatelessWidget {
  const PathientBed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Ahmed Ali',
          style: headingStyle,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.message),
            onPressed: () {
              // Chat
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: const VideoPlayerWidget(videoPath: 'assets/beds2.mp4'),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 5,
              child: GridView.count(
                
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 15,
                children: [
                  _buildGridItem(
                    context,
                    'assets/personaldata.png',
                    'Personal data',
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PersonalData()));
                    },
                  ),
                  _buildGridItem(
                    context,
                    'assets/Vital_Sign.png',
                    'Vital signs',
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const VitalSign()));
                    },
                  ),
                  _buildGridItem(
                    context,
                    'assets/report.png',
                    'Patient Reports',
                    () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const PatientReport()));
                    },
                  ),
                  _buildGridItem(
                    context,
                    'assets/task.png',
                    'Tasks',
                    () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => const TaskPage()));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(
      BuildContext context, String image, String title, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        surfaceTintColor: ThemeManager.deepBlue,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: headingStyle.copyWith(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
