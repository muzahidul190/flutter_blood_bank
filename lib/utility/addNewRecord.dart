import 'package:flutter/material.dart';
import 'package:flutter_blood_bank/jsonOperations/Services.dart';
import 'package:flutter_blood_bank/jsonOperations/location.dart';
import 'package:intl/intl.dart';

import '../jsonOperations/jsonToDart.dart';

class AddNewRecord extends StatefulWidget {
  const AddNewRecord({super.key, required this.id});
  final int id;

  @override
  State<AddNewRecord> createState() => _AddNewRecordState();
}

class _AddNewRecordState extends State<AddNewRecord> {
  TextEditingController dateinput = TextEditingController();
  TextEditingController details = TextEditingController();

  List<Donor>? _donor;
  List<Location> _location = [];
  String currentLocation = 'Select Location';

  @override
  void initState() {
    dateinput.text = DateFormat('yyyy-MM-dd').format(DateTime.now());
    super.initState();
    Services.getDonor(widget.id).then((donor) {
      setState(() {
        _donor = donor;
      });
    });
    Services.getLocations().then((location) {
      setState(() {
        _location = location;
        currentLocation = _location[0].locationName;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: 240,
            child: Column(
              children: [
                const Text('Add new Donation Record'),
                TextField(
                  controller: dateinput,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.calendar_today),
                    labelText: 'Enter Date',
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now());
                    if (pickedDate != null) {
                      print(pickedDate);
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      print(formattedDate);
                      setState(() {
                        dateinput.text = formattedDate;
                      });
                    } else {
                      print('Date is not Selected');
                    }
                  },
                ),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                      icon: Icon(Icons.location_pin),
                      labelText: 'Select Location',
                    ),
                    value: currentLocation,
                    items: _location.map((map) {
                      return DropdownMenuItem<String>(
                        value: map.locationName,
                        child: Text(
                          map.locationName,
                        ),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        currentLocation = value!;
                      });
                    }),
                TextField(
                  controller: details,
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.insert_comment),
                    labelText: 'Enter Details',
                    hintText: 'Optional Field...',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: (() {}),
          child: const Text('Add Record'),
        ),
        TextButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            child: const Text('Cancel'))
      ],
    );
  }
}
