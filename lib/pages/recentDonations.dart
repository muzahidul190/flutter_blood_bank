import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/jsonOperations/Services.dart';
import 'package:flutter_blood_bank/utility/appDrawer.dart';
import 'package:intl/intl.dart';

import '../jsonOperations/donationRecords.dart';

class RecentDonations extends StatefulWidget {
  const RecentDonations({super.key});

  @override
  State<RecentDonations> createState() => _RecentDonationsState();
}

class _RecentDonationsState extends State<RecentDonations> {
  int recordCounter = 0;
  List<Record>? _records;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _loading = true;
    Services.getRecords().then((records) => {
          setState(() {
            _records = records;
            _loading = false;
            recordCounter = _records!.length;
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(_loading ? 'Loading...' : 'Recent Blood Donation Records...'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text('All Recent Donations.')],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: null == _records ? 0 : _records!.length,
              itemBuilder: (context, index) {
                Record record = _records![index];
                var dt = HttpDate.parse(record.date);
                return ListTile(
                  title: Text(record.donorName.toString()),
                  subtitle: Text(
                      '${DateFormat('MMMM').format(dt)} ${dt.day}, ${dt.year}'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text('${recordCounter == 0 ? 'No' : '$recordCounter'} record'
                '${recordCounter == 1 ? '' : 's'}'
                ' found.'),
          ),
        ],
      ),
    );
  }
}
