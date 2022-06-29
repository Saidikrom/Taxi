// ignore_for_file: constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:map/Enter.dart';
import 'OTPScreen.dart';

enum Status { Waiting, Error }

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controller = TextEditingController();
  final code = 1;
  String verificationId = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const EnterPage()));
                    },
                    icon: const Icon(Icons.arrow_back),
                    color: Colors.black,
                  ),
                  title: const Padding(
                    padding: EdgeInsets.only(left: 40),
                    child: Text(
                      "Ro'yxatdan O'tish",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  children: [
                    Column(
                      children: [
                        Image.asset("assets/Background.png"),
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: Form(
                            //TEXTFORMFIELD

                            child: TextFormField(
                              onChanged: (value) async {
                                print(value);
                              },
                              controller: _controller,
                              style: const TextStyle(
                                fontSize: 25,
                                height: 1,
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 79, 74, 82),
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                  borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 65, 0, 102),
                                      width: 2.0),
                                ),
                                hintText: 'Raqamingiz',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    _controller.clear();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                  splashColor: Colors.transparent,
                                  highlightColor: Colors.transparent,
                                ),
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 15),
                                  child: Text(
                                    "+998 ",
                                    style: TextStyle(fontSize: 25),
                                  ),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.black, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                        ),

                        // TEXT
                        const Text(
                          "Telefon raqamingizni kiriting",
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 25),

                          // MATERIALBUTTON
                          child: MaterialButton(
                            onPressed: () {
                              // logInUser(context);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => OTPScreen(
                                        phone: _controller.text,
                                        code: code,
                                        verificationId: verificationId,
                                      )));
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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void logInUser(BuildContext context) async {
    // final User firebaseUser = (await _firebaseAut)
  }
}
