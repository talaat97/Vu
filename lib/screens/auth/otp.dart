import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:vue_v4/screens/home/home.dart';
import 'package:vue_v4/services/theme_services.dart';
import '../../app/cache_helper/cache_helper.dart';
import '../../models/uid.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_outlined),
                  ),
                ),
                Container(
                  width: 300,
                  height: 300,
                  alignment: Alignment.center,
                  child: Image.asset('assets/otp.png'),
                ),
                const SizedBox(height: 10),
                const Text(
                  "OTP Verification",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Enter the OTP send to your number ",
                  style: TextStyle(
                      color: Colors.black38,
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: ThemeManager.deepBlue)),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600)),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(height: 110),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Did not recived OTP ? ',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        'Resend',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ThemeManager.deepBlue),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 13),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: CustomButton(
                      text: 'Varify',
                      onPressed: () {
                        if (otpCode != null) {
                          //CashHelper///////////
                          CacheHelper.saveData(key: 'introScreen', value: true)
                              .then(
                            (value) {
                              print('intro is visited');
                            },
                          );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const Home(),
                            ),
                          );
                        } else {
                          showSnakeBar(
                              context, const Text('enter 6-digets code'));
                        }
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }

  // void verifyOtp(context, userOtp) {
  //   final ap = Provider.of<AuthProvider>(context, listen: false);
  //   ap.verifyOtp(
  //     context: context,
  //     phoneNumber: widget.verificationId,
  //     userOtp: userOtp,
  //     onSuccess: () {
  //       //checking if user exist in db
  //       ap.checkExistingUser().then((value) async {
  //         if (value == true) {
  //           //user Exist in our app

  //           ap.getDataFromFireStore().then(
  //                 (value) => ap.saveUserDataToSP().then(
  //                       (value) => ap.setSignIn().then(
  //                             (value) => Navigator.pushAndRemoveUntil(
  //                                 context,
  //                                 MaterialPageRoute(
  //                                   builder: (context) => const HomeScreen(),
  //                                 ),
  //                                 (route) => false),
  //                           ),
  //                     ),
  //               );
  //           Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(builder: (context) => const HomeScreen()),
  //             (route) => false,
  //           );
  //         } else {
  //           //new user
  //           Navigator.pushAndRemoveUntil(
  //             context,
  //             MaterialPageRoute(builder: (context) => const RoleScreen()),
  //             (route) => false,
  //           );
  //         }
  //       });
  //     },
  //   );
  // }
}
