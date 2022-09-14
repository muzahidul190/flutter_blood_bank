import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/utility/appDrawer.dart';

class BloodDonor extends StatefulWidget {
  const BloodDonor({super.key, required this.id});
  final String id;
  @override
  State<BloodDonor> createState() => _BloodDonorState();
}

class _BloodDonorState extends State<BloodDonor> {
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
          title: const Text('This Donor Name'),
        ),
        drawer: const AppDrawer(),
        body: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  maxRadius: 50,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage('assets/images/icon.png'),
                ),
                const Text(
                  'Donor Name',
                  style: TextStyle(color: Colors.blue),
                ),
                Text(
                  widget.id,
                  style: const TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
