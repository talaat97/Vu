import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

File? _image;
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
                            'assets/Doctors1.png',
                            fit: BoxFit.cover,
                          ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final pickedFile = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (pickedFile != null) {
                        _image = File(pickedFile.path);

                        Navigator.of(context).pop(); // Close the dialog
                      }
                    },
                    child: Text('Change picture'),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: CircleAvatar(
        radius: 50.0,
        child: ClipOval(
          child: _image != null
              ? Image.file(
                  _image!,
                  width: 45.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/Doctors1.png',
                  width: 45.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    ),
  );
}

//not used
Future<void> _pickImage(context) async {
  final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    _image = File(pickedFile.path);

    Navigator.of(context).pop(); // Close the dialog
  }
}
