import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/appDrawer.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.red.shade900),
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('About Developer'),
        ),
        drawer: AppDrawer(),
        body: Center(
          child: Text('This is @Muzahidul190.'),
        ),
      ),
    );
  }
}
