import 'package:flutter/material.dart';

import '../../services/theme_services.dart';

class PatientReport extends StatefulWidget {
  const PatientReport({super.key});

  @override
  PatientReportState createState() => PatientReportState();
}

class PatientReportState extends State<PatientReport> {
  int _expandedIndex = -1;

  void _toggleExpansion(int index) {
    setState(() {
      _expandedIndex = _expandedIndex == index ? -1 : index;
    });
  }

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
      body: ListView(
        children: <Widget>[
          _buildExpandableTile(
            'Radiology',
            [
              openImage('assets/heart.jpg', 'heart.jpg'),
              openImage('assets/head.jpg', 'head.jpg'),
              openImage('assets/hand.jpg', 'hand.jpg'),
              openImage('assets/ho7d.jpg', 'ho7d.jpg'),
            ],
            0,
          ),
          _buildExpandableTile(
            'Laboratory',
            [
              openImage('assets/NurseInChooseRole.png', 'Heat_rate.png'),
              openImage('assets/NurseInChooseRole.png', 'Heat_rate.png'),
            ],
            1,
          ),
          _buildExpandableTile(
            'Daily Reports',
            [
              openImage('assets/NurseInChooseRole.png', 'Heat_rate.png'),
              openImage('assets/NurseInChooseRole.png', 'Heat_rate.png'),
              openImage('assets/NurseInChooseRole.png', 'Heat_rate.png'),
              openImage('assets/NurseInChooseRole.png', 'Heat_rate.png'),
              openImage('assets/NurseInChooseRole.png', 'Heat_rate.png'),
            ],
            2,
          ),
        ],
      ),
    );
  }

  Widget openImage(String image, String nameImgae) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (ctx) {
          return Dialog(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
                Text(nameImgae),
              ],
            ),
          );
        },
      ),
      child: Text(nameImgae),
    );
  }

  Widget _buildExpandableTile(String title, List<Widget> items, int index) {
    bool isExpanded = _expandedIndex == index;

    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(title),
            trailing: IconButton(
              icon: Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                _toggleExpansion(index);
              },
            ),
            onTap: () {
              _toggleExpansion(index);
            },
          ),
          if (isExpanded)
            Column(
              children: items.map((Widget item) {
                return ListTile(
                  leading: const Icon(Icons.insert_drive_file),
                  title: item,
                );
              }).toList(),
            ),
        ],
      ),
    );
  }
}
