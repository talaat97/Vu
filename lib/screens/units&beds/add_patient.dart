import 'package:flutter/material.dart';


import '../../services/theme_services.dart';

class AddPatient extends StatefulWidget {
  const AddPatient({super.key});

  @override
  AddPatientState createState() => AddPatientState();
}

class AddPatientState extends State<AddPatient> {
  bool _isMale = false;
  bool _isFemale = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Add patient',
          style: headingStyle,
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildTextField('Name', 'Enter patient name...'),
            _buildTextField('ID', 'Enter patient ID...'),
            _buildTextField('Age', ''),
            const SizedBox(height: 16),
            const Text('Gender', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Checkbox(
                  value: _isMale,
                  onChanged: (bool? value) {
                    setState(() {
                      _isMale = value ?? false;
                      _isFemale = !(_isMale);
                    });
                  },
                ),
                const Text('Male'),
                Checkbox(
                  value: _isFemale,
                  onChanged: (bool? value) {
                    setState(() {
                      _isFemale = value ?? false;
                      _isMale = !(_isFemale);
                    });
                  },
                ),
                const Text('Female'),
              ],
            ),
            _buildTextField('Height', 'in cm...'),
            _buildTextField('Weight', 'in kg...'),
            _buildTextField('Companion Phone', ''),
            const SizedBox(height: 16),
            const Center(
              child: Text(
                'more details',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(

        decoration: InputDecoration(
          
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ThemeManager.deepBlue),
            borderRadius: BorderRadius.circular(8.0),
          ),
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
