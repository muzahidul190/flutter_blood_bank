import 'package:flutter/material.dart';

import '../utility/appDrawer.dart';

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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            singleBox(id: '3', name: 'Nishad', group: 'O+'),
            singleBox(id: '1', name: 'Prithvi', group: 'A-'),
            singleBox(id: '2', name: 'Shahjahan', group: 'AB+'),
            singleBox(id: '6', name: 'Muzahid', group: 'B+'),
            singleBox(id: '4', name: 'Masud', group: 'A+'),
            singleBox(id: '5', name: 'Joyti', group: 'AB-'),
            singleBox(id: '5', name: 'Joyti', group: 'A-'),
            singleBox(id: '5', name: 'Joyti', group: 'A-'),
            singleBox(id: '5', name: 'Joyti', group: 'A-'),
            singleBox(id: '5', name: 'Joyti', group: 'A-'),
            singleBox(id: '5', name: 'Joyti', group: 'A-'),
          ],
        ),
      ),
    );
  }
}

Widget singleBox({required String id, String? name, String? group}) {
  return Container(
    color: Colors.teal,
    margin: const EdgeInsets.only(bottom: 8.0),
    child: SizedBox(
      height: 110,
      child: Padding(
        padding: const EdgeInsets.only(left: 9, right: 9, top: 3, bottom: 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      'Name: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      '$name',
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Id: ',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Text(
                      id,
                      style: const TextStyle(color: Colors.white, fontSize: 19),
                    )
                  ],
                ),
              ],
            ),
            Container(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: const AssetImage('assets/images/icon.png'),
                  backgroundColor: Colors.transparent,
                  radius: 50,
                  child: Text(
                    '$group',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
                // child: Text(
                //   '$group',
                //   style: TextStyle(color: Colors.white),
                // ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
