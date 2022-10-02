import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Splash Screen',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.red.shade900),
          primarySwatch: Colors.red,
        ),
        home: const SplashScreen());
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var duration = const Duration(seconds: 2);
    return Timer(duration, navigatePage);
  }

  void navigatePage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade600,
      body: Center(
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          maxRadius: 80,
          child: Image.asset('assets/images/icon.png'),
        ),
      ),
    );
  }
}
