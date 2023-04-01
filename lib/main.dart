// ignore_for_file: prefer_const_constructors

import 'package:apicalling_demo/Splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   runApp(
      MaterialApp(home: Splash_Screen(),
      debugShowCheckedModeBanner: false)
  );
}
