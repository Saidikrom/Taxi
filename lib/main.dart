// ignore_for_file: constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:map/Enter.dart';
import 'dart:io';

const bool USE_EMULATOR = true;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  if (USE_EMULATOR) {
    _connectToFirebaseEmulator();
  }
  runApp(const MyApp());
}

Future _connectToFirebaseEmulator() async {
  const fireStorePort = "8090";
  const authPort = 9099;
  final localHost = Platform.isAndroid ? '10.0.2.2' : 'localhost';
  FirebaseFirestore.instance.settings = Settings(
      host: "$localHost:$fireStorePort",
      sslEnabled: false,
      persistenceEnabled: false);

  await FirebaseAuth.instance.useAuthEmulator(localHost, authPort);
  // await FirebaseStorage.instance.useStorageEmulator(localHost, storagePort);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EnterPage(),
    );
  }
}
