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
        body: SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        maxRadius: 70,
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage('assets/images/default_male.png'),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Name: '),
                        Text('Total Donation: ')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Donor Name'),
                        Text('4'),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //Visible only to Logged in Donors...
                  children: [
                    TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                    title:
                                        const Text('Add new donation Record'),
                                    content: Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          const Text('Hello'),
                                          TextField(
                                            onChanged: (value) {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ));
                        },
                        child: const Text('Add new Record'))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Donation History',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
