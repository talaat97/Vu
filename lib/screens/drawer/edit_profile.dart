import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:vue_v4/models/uid.dart';
import 'package:vue_v4/services/theme_services.dart';

import '../../widgets/input_field.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _roleController = TextEditingController();
  final _phoneController = TextEditingController();
  String _gender = 'female';
  DateTime _selectDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                size: 30,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: ThemeManager.gryVu,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.white, width: 2)),
            child: CircleAvatar(
              radius: 100,
              backgroundColor: ThemeManager.deepBlue,
              child: Image.asset(
                'assets/DocorInChooseRole.png',
              ),
            ),
          ),
          InputField(
            controller: _usernameController,
            text: 'name',
            hint: 'wessam mahmoud',
          ),
          InputField(
            controller: _roleController,
            text: 'Role',
            hint: 'cardiolgist',
          ),
          InputField(
            controller: _phoneController,
            text: 'phone',
            hint: '0113809491',
          ),
          InputField(
            controller: _emailController,
            text: 'phone',
            hint: 'wessam_mahmoud10@gmail.com',
          ),
          InputField(
            text: 'Date',
            hint: DateFormat.yMd().format(DateTime.now()),
            widget: IconButton(
              onPressed: () {
                getDateFromUser();
              },
              icon: const Icon(
                Icons.calendar_today,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 60,
            width: 400,
            child: CustomButton(
              text: 'Update profile',
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  void getDateFromUser() async {
    DateTime? userPikedDate = await showDatePicker(
        context: context,
        initialDate: _selectDate,
        firstDate: DateTime(2020),
        lastDate: DateTime(2030));

    if (userPikedDate != null) {
      setState(() {
        _selectDate = userPikedDate;
      });
    } else {
      print('no thing piked');
    }
  }
}
