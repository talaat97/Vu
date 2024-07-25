import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vue_v4/services/theme_services.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

File? _image;

class _ProfileState extends State<Profile> {
  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      Navigator.of(context).pop(); // Close the dialog
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeManager.deepBlue,
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(fontSize: 30),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'wessam mahmoud',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                CircleAvatar(
                  radius: 130,
                  child: pickImage(context),
                ),
                const Text(
                  'change phote',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    item('Email', 'wessam mahmoud.hospital.com'),
                    item('Password', '**************'),
                    item('Date of birth', '3/12/1999'),
                    item('spicalist ', 'radoilogyist'),
                    item('Gender', 'female'),
                    item('Phone', '0113809491'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item(
    String leading,
    String title,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            leading,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: ThemeManager.litteBlue),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Center pickImage(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                      child: _image != null
                          ? Image.file(
                              _image!,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/DocorInChooseRole.png',
                              fit: BoxFit.cover,
                            ),
                    ),
                    TextButton(
                      onPressed: _pickImage,
                      child: const Text('Change picture '),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage('assets/DocorInChooseRole.png')),
      ),
    );
  }
}
