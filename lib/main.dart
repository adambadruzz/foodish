import 'package:flutter/material.dart';
import 'package:foodishmobile/view/splash/splashscreen.dart';

import 'view/home/home.dart';
import 'view/profile/profile.dart';

import 'navigator/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
    );
  }
}
