import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/utility/appDrawer.dart';

class BloodDonor extends StatefulWidget {
  const BloodDonor({super.key});

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
          title: const Text('About Developer'),
        ),
        drawer: const AppDrawer(),
        body: Center(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircleAvatar(
                  maxRadius: 50,
                  backgroundImage: AssetImage('assets/images/avatarLatest.jpg'),
                ),
                Text(
                  'Muzahidul Islam',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
