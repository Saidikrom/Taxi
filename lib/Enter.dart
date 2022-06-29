import 'package:flutter/material.dart';
import 'package:map/Register.dart';
import 'package:map/kirish.dart';

class EnterPage extends StatefulWidget {
  const EnterPage({Key? key}) : super(key: key);

  @override
  State<EnterPage> createState() => _EnterPageState();
}

class _EnterPageState extends State<EnterPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 700,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 466,
                  child: Image.asset(
                    "assets/1.png",
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: MaterialButton(
                onPressed: () {
                  // logInUser(context);

                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Kirish()));
                },
                color: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 55,
                minWidth: 350,
                child: const Text(
                  "KIRISH",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              child: MaterialButton(
                onPressed: () {
                  // logInUser(context);
                  controller.clear();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterPage()));
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
                  "RO'YXATDAN O'TISH",
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
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
              ),
              child: Row())
        ],
      ),
    );
  }
}
