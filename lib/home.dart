import 'package:flutter/material.dart';

import 'appDrawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blood Bank App HomePage'),
      ),
      drawer: const AppDrawer(),
      body: Center(
        child: Image.asset('assets/images/avatarLatest.jpg'),
      ),
    );
  }
}
