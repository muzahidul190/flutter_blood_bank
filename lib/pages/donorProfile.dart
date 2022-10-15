import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/jsonOperations/Services.dart';
import 'package:flutter_blood_bank/jsonOperations/donationRecords.dart';
import 'package:flutter_blood_bank/utility/addNewRecord.dart';
import 'package:flutter_blood_bank/utility/allFunctions.dart';
import 'package:flutter_blood_bank/utility/appDrawer.dart';
import 'package:intl/intl.dart';

import '../jsonOperations/jsonToDart.dart';

class BloodDonor extends StatefulWidget {
  const BloodDonor({super.key, required this.id});
  final int id;
  @override
  State<BloodDonor> createState() => _BloodDonorState();
}

class _BloodDonorState extends State<BloodDonor> {
  //My code start here

  TextEditingController dateinput = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController details = TextEditingController();

  List<Donor>? _donor;
  List<Record>? _records;
  int recordCounter = 0;
  bool _loading = true;
  @override
  void initState() {
    DateTime now = DateTime.now();
    dateinput.text = DateFormat('yyyy-MM-dd').format(now);
    super.initState();
    _loading = true;
    Services.getDonor(widget.id).then((donor) {
      setState(() {
        _donor = donor;
        _loading = false;
      });
    });
    Services.getRecord(widget.id).then((records) {
      setState(() {
        _records = records;
        recordCounter = _records!.length;
      });
    });
  }

  //My code ends here...

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Donor Profile',
      theme: ThemeData(
        appBarTheme: AppBarTheme(color: Colors.red.shade900),
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_loading
              ? 'Loading...'
              : (_donor == null ? 'No Donor Found' : _donor![0].name)),
        ),
        drawer: const AppDrawer(),
        body: SizedBox(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            maxRadius: 70,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage('assets/images/default_male.png'),
                          ),
                        ),
                        // const Text(
                        //   'Donor Name',
                        //   style: TextStyle(color: Colors.blue),
                        // ),
                        // Text(
                        //   widget.id.toString(),
                        //   style: const TextStyle(color: Colors.blue),
                        // ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text('Name: '),
                        Text('Total Donation: '),
                        Text('Phone Number: ')
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(_donor == null
                            ? 'Donor Not found'
                            : _donor![0].name),
                        Text(_records == null
                            ? '0'
                            : _records!.length.toString()),
                        Text(_donor == null
                            ? 'No such donor'
                            : (_donor![0].phone == null
                                ? 'No Phone'
                                : _donor![0].phone.toString())),
                      ],
                    ),
                  ),
                ],
              ),
              if (true)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    //Visible only to Logged in Donors...
                    children: [
                      TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) =>
                                    AddNewRecord(id: widget.id));
                          },
                          child: const Text('Add new Record'))
                    ],
                  ),
                ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Donation History',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const Divider(),
                        (null == _records)
                            ? const Text('No Donation records found!')
                            : (_records!.length > 0)
                                ? Container(
                                    color: Colors.amber,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                              flex: 1,
                                              child: Center(
                                                  child: Text('Serial'))),
                                          Expanded(
                                              flex: 2,
                                              child: Text('Donation Date')),
                                          Expanded(
                                              flex: 2,
                                              child: Text('Days Passed')),
                                        ],
                                      ),
                                    ),
                                  )
                                : const Center(
                                    child: Text('No Donation records found!')),
                        ListView.builder(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: null == _records ? 0 : _records!.length,
                          itemBuilder: (context, index) {
                            Record record = _records![index];
                            var dt = HttpDate.parse(record.date);
                            String dateFormat =
                                '${DateFormat('MMMM').format(dt)} ${dt.day}, ${dt.year}';
                            return Container(
                              color:
                                  (index % 2 == 0) ? Colors.white : Colors.grey,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        flex: 1,
                                        child: Center(
                                            child:
                                                Text((index + 1).toString()))),
                                    Expanded(flex: 2, child: Text(dateFormat)),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                            AllFunctions.dateDifferences(
                                                start: _records![index].date))),
                                    // Text((index + 1).toString()),
                                    // Text(record.date),
                                    // Text(AllFunctions.dateDifferences(
                                    //     start: _records![index].date)),
                                  ],
                                ),
                              ),
                            );
                            // ListTile(
                            //   title: Text(record.donorName.toString()),
                            //   subtitle: Text(record.date),
                            // );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
