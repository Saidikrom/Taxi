// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map/MainPage.dart';
import 'package:map/Register.dart';
import 'package:map/kirish.dart';
import 'package:pinput/pinput.dart';

// ignore: constant_identifier_names
enum Status { Waiting, Error }

class OTPScreen extends StatefulWidget {
  final String phone;
  final code;
  final String verificationId;
  const OTPScreen(
      {Key? key,
      required this.phone,
      required this.code,
      required this.verificationId})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final controller = TextEditingController();
  final focusNode = FocusNode();
  FirebaseAuth _auth = FirebaseAuth.instance;
  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const MyPage()));
      }
    } on FirebaseAuthException catch (e) {
      print("catch");
    }
  }

  @override
  Widget build(BuildContext context) {
    const borderColor = Color.fromRGBO(114, 178, 238, 1);
    const fillColor = Color.fromRGBO(222, 231, 240, .57);
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    if (widget.code == 0) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const Kirish()));
                    } else if (widget.code == 1) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterPage()));
                    }
                  },
                  icon: const Icon(Icons.arrow_back),
                  color: Colors.black,
                ),
                title: const Padding(
                  padding: EdgeInsets.only(left: 60),
                  child: Text(
                    "Tasdiqlash",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            Image.asset(
              "assets/otp.png",
              scale: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Text(
                          "+998${widget.phone} raqamiga 4 xonaliy tasdiqlash kodi SMS holatida yuborildi!",
                          style: const TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  SizedBox(
                    height: 68,
                    child: Pinput(
                      length: 4,
                      controller: controller,
                      focusNode: focusNode,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: defaultPinTheme.copyWith(
                        height: 68,
                        width: 64,
                        decoration: defaultPinTheme.decoration!.copyWith(
                          border: Border.all(color: borderColor),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 140),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 160,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MaterialButton(
                onPressed: () {
                  verify();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const MyPage()));
                },
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 55,
                minWidth: 350,
                child: const Text(
                  "KEYINGISI",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: MaterialButton(
                onPressed: () {
                  // logInUser(context);
                  controller.clear();
                  // Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (context) => MyPage()));
                },
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                      color: Color.fromARGB(255, 2, 84, 190), width: 2),
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 55,
                minWidth: 350,
                child: const Text(
                  "QAYTA YUBORISH",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verify() async {
    PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: controller.text);
    signInWithPhoneAuthCredential(phoneAuthCredential);
  }
}
