import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/jsonOperations/Services.dart';
import 'package:intl/intl.dart';

import '../jsonOperations/donationRecords.dart';
import '../pages/donorProfile.dart';

class HomeDoubleTapDialogBox extends StatefulWidget {
  const HomeDoubleTapDialogBox(
      {super.key, required this.id, required this.context});
  final int id;
  final BuildContext context;

  @override
  State<HomeDoubleTapDialogBox> createState() => _HomeDoubleTapDialogBoxState();
}

class _HomeDoubleTapDialogBoxState extends State<HomeDoubleTapDialogBox> {
  List<Record>? _records;
  int recordCounter = 0;
  String lastDonate = 'No Donation Yet!';
  String daysAgo = '';

  @override
  void initState() {
    super.initState();
    Services.getRecord(widget.id).then((records) {
      setState(() {
        _records = records;
        recordCounter = _records!.length;
        if (recordCounter > 0) {
          var dt = HttpDate.parse(_records![0].date);
          lastDonate = '${DateFormat('MMMM').format(dt)} ${dt.day}, ${dt.year}';

          var from = DateTime(dt.year, dt.month, dt.day);
          var now = DateTime.now();
          var to = DateTime(now.year, now.month, now.day);
          var diffDays = (to.difference(from).inDays).round();
          daysAgo = '$diffDays day';
          if (diffDays > 30) {
            int days = diffDays % 30;
            diffDays -= days;
            int months = diffDays.toInt() ~/ 30;
            daysAgo = '$months month';
            if (months > 1) {
              daysAgo += 's';
            }
            if (days > 0) {
              daysAgo += ' $days day';
            } else {
              daysAgo += '.';
            }
            if (days > 1) {
              daysAgo += 's.';
            }
          } else if (diffDays > 1) {
            daysAgo += 's.';
          } else {
            daysAgo += '.';
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Summery')),
      content: SizedBox(
        height: 80,
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Total Donation: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(recordCounter.toString()),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Last Donated: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Expanded(child: Text(lastDonate))
              ],
            ),
            if (recordCounter > 0)
              Row(
                children: [
                  const Text(
                    'Days Passed: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(daysAgo),
                ],
              )
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(widget.context);
              Navigator.push(widget.context,
                  MaterialPageRoute(builder: (context) {
                return BloodDonor(id: widget.id);
              }));
            },
            child: const Text('Show more Details')),
        TextButton(
            onPressed: () {
              Navigator.pop(widget.context);
            },
            child: const Text('Dismiss')),
      ],
    );
  }
}
