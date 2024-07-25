import 'package:flutter/material.dart';
import 'package:vue_v4/screens/auth/otp.dart';
import 'package:vue_v4/services/theme_services.dart';

import '../../models/uid.dart';

class ChooseRole extends StatefulWidget {
  const ChooseRole({super.key});

  @override
  State<ChooseRole> createState() => _ChooseRoleState();
}

class _ChooseRoleState extends State<ChooseRole> {
  String role = 'doctor';
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'CHOOSE YOUR ROLE',
              style: TextStyle(
                  color: ThemeManager.deepBlue,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _roleOption('doctor', 'assets/DocorInChooseRole.png'),
                const SizedBox(width: 10),
                _roleOption('Nurse', 'assets/NurseInChooseRole.png'),
              ],
            ),
            Text(
              "Login to get started!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ThemeManager.deepBlue),
            ),
            const Text(
              "We will send you a code to verify your mobile number. Enter Mobile number",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                cursorColor: ThemeManager.deepBlue,
                controller: phoneController,
                decoration: InputDecoration(
                  prefix: const Text('+20    '),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: ThemeManager.deepBlue)),
                  border: const UnderlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              width: 155,
              height: 50,
              child: CustomButton(
                text: 'Login',
                onPressed: () async {
                  // User user = User(phone: phoneController.text, role: role);
                  // print(phoneController.text);
                  // print(role);

                  // ApiService apiService = ApiService(
                  //     baseUrl: 'http://192.168.1.5:9090/user/authenticate');
                  // print('post req work');

                  // await apiService.post(apiService.baseUrl, user.toJson());
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const OtpScreen(),
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

  Widget _roleOption(String roleName, String assetPath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          role = roleName;
        });
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                  color:
                      role == roleName ? ThemeManager.deepBlue : Colors.white,
                  width: 2),
            ),
            height: 180,
            width: 180,
            child: Image.asset(
              assetPath,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            roleName,
            style: TextStyle(
                color: ThemeManager.deepBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
