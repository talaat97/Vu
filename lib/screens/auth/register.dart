import 'package:flutter/material.dart';
import 'package:vue_v4/models/uid.dart';
import 'package:vue_v4/screens/auth/otp.dart';

import '../../services/theme_services.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 300,
              height: 300,
              alignment: Alignment.center,
              child: Image.asset(
                'assets/login.png',
              ),
            ),
            const SizedBox(height: 17),
            Text(
              "login to get started ! ",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ThemeManager.deepBlue),
            ),
            const SizedBox(height: 14),
            const Text(
              " we will send you code to verify your mobile number "
              " Enter Mobile number",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 17),
            TextFormField(
              keyboardType: TextInputType.number,
              cursorColor: ThemeManager.deepBlue,
              controller: phonecontroller,
              decoration: InputDecoration(
                prefix: const Text('+20    '),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: ThemeManager.deepBlue)),
                focusColor: ThemeManager.deepBlue,
                border: const UnderlineInputBorder(),
              ),
            ),
            const SizedBox(height: 160),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: CustomButton(
                text: 'Login',
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OtpScreen(),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
