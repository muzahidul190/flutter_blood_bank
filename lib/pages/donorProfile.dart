import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/jsonOperations/Services.dart';
import 'package:flutter_blood_bank/jsonOperations/donationRecords.dart';
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

  List<Donor>? _donor;
  List<Record>? _records;
  int recordCounter = 0;
  bool _loading = true;
  @override
  void initState() {
    dateinput.text = DateTime.now().toString();
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
                          widget.id.toString(),
                          style: const TextStyle(color: Colors.blue),
                        ),
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
                        Text('Total Donation: ')
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
                                builder: (context) => AlertDialog(
                                      content: SingleChildScrollView(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            height: 170,
                                            child: Column(
                                              children: [
                                                const Text(
                                                    'Add new donation Record'),
                                                TextField(
                                                  controller: dateinput,
                                                  decoration:
                                                      const InputDecoration(
                                                    icon: Icon(
                                                        Icons.calendar_today),
                                                    labelText: 'Enter Date',
                                                  ),
                                                  readOnly: true,
                                                  onTap: () async {
                                                    DateTime? pickedDate =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime(1990),
                                                            lastDate:
                                                                DateTime.now());
                                                    if (pickedDate != null) {
                                                      print(pickedDate);
                                                      String formattedDate =
                                                          DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(
                                                                  pickedDate);
                                                      print(formattedDate);
                                                      setState(() {
                                                        dateinput.text =
                                                            formattedDate;
                                                      });
                                                    } else {
                                                      print(
                                                          'Date is not Selected');
                                                    }
                                                  },
                                                ),
                                                TextField(
                                                  onChanged: (value) {},
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ));
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
                        ListView.builder(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: null == _records ? 0 : _records!.length,
                          itemBuilder: (context, index) {
                            Record record = _records![index];
                            return ListTile(
                              title: Text(record.donorName.toString()),
                              subtitle: Text(record.date),
                            );
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
